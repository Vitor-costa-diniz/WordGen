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
        matrizGenerator.verifycaWords(triedWord: word)
    }
    
    func printCurrentGame() {
        matrizGenerator.printMatriz()
    }
    
    func wereAllWordsFinded() -> Bool {
        return matrizGenerator.verifyRemainWords()
    }
    
    func displayWordProgress() {
        let totalWords = matrizGenerator.words.count
        let unfoundWords = matrizGenerator.words.filter { $0.wasFound }.count
        
        print("Current progress: \(unfoundWords)/\(totalWords)")
    }
    
    func displayTheme() {
        print("Current Theme: \(matrizGenerator.theme)")
    }
    
    func gameOptions(option: String) {
        switch option {
        case GameOptions.hint:
            matrizGenerator.showHint()
        case GameOptions.resolve:
            matrizGenerator.resolveGame()
        case GameOptions.quit:
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
