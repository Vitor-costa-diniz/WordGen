//
//  File.swift
//
//
//  Created by Vitor Costa on 09/03/24.
//

import Foundation

class PrintStatements {
    private let matrizGenerator: MatrizGenerator = MatrizGenerator()
    
    func printInGameOptions() {
        print("""
    IN GAME OPTIONS:
    !hint          Highlights a letter of a word that has not been found yet.
    !resolve       Resolve game.
    !exit          Exit the game.
    
    """)
    }
    
    func startGame(size: Int) {
        let wordGen = """
                 _     _  _______  ______    ______   _______  _______  __    _
                | | _ | ||       ||    _ |  |      | |       ||       ||  |  | |
                | || || ||   _   ||   | ||  |  _    ||    ___||    ___||   |_| |
                |       ||  | |  ||   |_||_ | | |   ||   | __ |   |___ |       |
                |       ||  |_|  ||    __  || |_|   ||   ||  ||    ___||  _    |
                |   _   ||       ||   |  | ||       ||   |_| ||   |___ | | |   |
                |__| |__||_______||___|  |_||______| |_______||_______||_|  |__|
                """

        let greenText = "\u{001B}[0;32m\(wordGen)\u{001B}[0m"
        print(greenText)
        
        print("")
        print("")
        
        matrizGenerator.generateMatriz(size: size)
    }
    
    func printCurrentGame() {
        matrizGenerator.printMatriz()
    }
}
