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
    
    
    func startGame() {
        matrizGenerator.boardSize = boardSize
        
        matrizGenerator.generateMatriz()
    }
    
}
