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
    
}
