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
        
        printStatements.startGame()

        matrizGenerator.generateMatriz()
        
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
    
    func gameOptions(option: String) {
        switch option.lowercased() {
        case "--hint":
            matrizGenerator.showHint()
        case "--resolve":
            print("teste")
        case "--exit":
            print("Sai")
        default:
            let _ = 0
        }
    }
}
