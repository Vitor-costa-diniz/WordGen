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
    
    func startGame() {
        matrizGenerator.boardSize = boardSize
        
        getTheme()
        
        matrizGenerator.generateGrid()
        
        printStatements.startGame()
        
        displayTheme()
        displayWordProgress()
        printCurrentGame()
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
    private func getTheme() {
        guard let theme = Constants.mockThemes.keys.randomElement() else { return }
        matrizGenerator.theme = theme
    }
}
