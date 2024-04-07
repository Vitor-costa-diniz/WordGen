//
//  File.swift
//
//
//  Created by Vitor Costa on 21/03/24.
//

import Foundation

class Game {
    var boardSize: Int = 0
    private let matrizGenerator: MatrizGenerator = MatrizGenerator()
    private let printStatements: PrintStatements = PrintStatements()
    
    func startGame() throws {
        do {
            matrizGenerator.boardSize = boardSize
            
            try getTheme()
            
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
        default:
            break
        }
    }
}

extension Game {
    private func getTheme() throws {
        FileHandler.projectName = "WordGen"

        do {
            for theme in Constants.mockThemes {
                let path: String = "Themes/\(theme.key).txt"
                try FileHandler.savePlainText(content: theme.value, at: path )
            }
            let themes = try FileHandler.listContents(in: "Themes")
                .map({$0.replacingOccurrences(of: ".txt", with: "")})
            guard let theme = themes.randomElement() else { return }
            matrizGenerator.theme = theme
            
            try getWords()
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

enum WordCountErrors: Error {
    case isEmpty
}
