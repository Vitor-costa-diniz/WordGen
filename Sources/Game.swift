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
        
        matrizGenerator.generateMatriz()

        printStatements.startGame()

        displayWordProgress()
        
        printCurrentGame()
    }
    
    func checkWord(word: String) {
        matrizGenerator.verificaWords(palavraTentada: word)
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
    
    func gameOptions(option: String) {
        switch option.lowercased() {
        case "--hint":
            matrizGenerator.showHint()
        case "--resolve":
            matrizGenerator.resolveGame()
        case "--exit":
            matrizGenerator.exitGame()
        default:
            break
        }
    }
}
