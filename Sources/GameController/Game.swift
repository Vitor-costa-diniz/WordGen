//
//  File.swift
//
//
//  Created by Vitor Costa on 21/03/24.
//

import Foundation

class Game {
    var boardSize: Int = 0
    var choosenTheme: String?
    var themeIsEmpty = true
    var continueGame = true
    private let matrizGenerator: MatrizGenerator = MatrizGenerator()
    private let printStatements: PrintStatements = PrintStatements()
    
    func startGame() throws {
        do {
            matrizGenerator.boardSize = boardSize
            
            if themeIsEmpty {
                try getTheme()
            }
            
            try getWords()
            
            matrizGenerator.generateGrid()
            
            printStatements.startGame()
            
            displayTheme()
            displayWordProgress()
            printCurrentGame()
        } catch {
            print("Error: The file for theme '\(matrizGenerator.theme)' is empty.")
            throw error
        }
    }
    
    func verifyChoosenTheme() {
        FileHandler.projectName = "WordGen"
        var theme: String = ""
        
        do {
            let themes = try FileHandler.listContents(in: "Themes")
                .map({$0.replacingOccurrences(of: ".txt", with: "")})
            theme = choosenTheme ?? ""
            if themes.contains(theme) {
                matrizGenerator.theme = theme
                themeIsEmpty = false
            } else {
                if !theme.isEmpty {
                    print("Selected theme does not exist. Please verify if you typed the theme name correctly. Here is the list of themes: \(themes.map({$0.replacingOccurrences(of: ".txt", with: "")}))")
                    continueGame = false
                }
            }
        } catch {
            print(error)
        }
    }
    
    func checkWord(word: String) {
        let wordFound = matrizGenerator.verifycaWords(triedWord: word)
        
        if !GameOptions.allCases.contains(where: {$0.rawValue == word}) {
            wordFound ? print("\(Constants.UseCases.youGotIt)".green) :
            print("\(Constants.UseCases.tryAgain)".red)
        }
    }
    
    func printCurrentGame() {
        matrizGenerator.printMatriz()
        print("")
    }
    
    func wereAllWordsFinded() {
        let wordsFidended = matrizGenerator.verifyRemainWords()
        
        if !wordsFidended {
            GameControl.shared.displayWinMessage = true
            GameControl.shared.keepGame = false
            printStatements.printWin()
        }
    }
    
    func displayWordProgress() {
        let totalWords = matrizGenerator.words.count
        let unfoundWords = matrizGenerator.words.filter { $0.wasFound }.count
        
        print("Current progress: \(unfoundWords)/\(totalWords)")
        print("")
    }
    
    func displayTheme() {
        print("Current Theme: \(matrizGenerator.theme)")
    }
    
    func printLine() {
        let line = String(repeating: "-", count: 37)
        print(line)
    }
    
    func gameOptions(option: String) {
        switch option {
        case GameOptions.hint.rawValue:
            printStatements.printHint()
            matrizGenerator.showHint()
            
        case GameOptions.resolve.rawValue:
            GameControl.shared.keepGame = false
            printStatements.printResolve()
            matrizGenerator.resolveGame()
            
        case GameOptions.quit.rawValue:
            matrizGenerator.exitGame()

        case GameOptions.monkey.rawValue:
            printStatements.mamaco()
        default:
            break
        }
    }
}

extension Game {
    private func getTheme() throws {
        do {
            for theme in Constants.mockThemes {
                let path: String = "Themes/\(theme.key).txt"
                try FileHandler.savePlainText(content: theme.value, at: path )
            }
            let themes = try FileHandler.listContents(in: "Themes")
                .map({$0.replacingOccurrences(of: ".txt", with: "")})
            guard let theme = themes.randomElement() else { return }
            matrizGenerator.theme = theme
        } catch {
            throw error
        }
    }
    
    private func getWords() throws {
        let theme = matrizGenerator.theme
        do {
            let words = try FileHandler.readPlainText(at: "Themes/\(theme).txt")
                .map({$0.replacingOccurrences(of: " ", with: "")})
                .map({$0.replacingOccurrences(of: "-", with: "")})
            if words.isEmpty { throw WordCountErrors.isEmpty }
            matrizGenerator.themeWords = words
        } catch {
            throw WordCountErrors.isEmpty
        }
    }
}
