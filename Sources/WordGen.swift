//
//  File.swift
//
//
//  Created by Vitor Costa on 07/03/24.
//
import ArgumentParser

struct WordGen: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "wordgen",
        abstract:         """
        
        WORDGEN
        
        Is a customizable word search projetc that aims to save you in times of boredom,
        in addition to all the cognitive benefits that a word search already brings,
        we also make it simple to the user make his own word search themed game.
        
        """,
        discussion: """
          IN GAME OPTIONS:
          !hint          Highlights a letter of a word that has not been found yet.
          !resolve       Resolve game.
          !exit          Exit the game.
          
          """)
    @Flag(name: [.customLong("start")], help: "Start game")
    var start: Bool = false
    
    @Option(name: [.customLong("size")], help: "Custom board size, min 10x10 and max 40x40")
    var size: Int = 11
    
    @Option(name: .long, help: "Choose a language between Portuguese and English.")
    var language: String?
    
    @Option(name: .shortAndLong, help: "Choose a theme from thise available, the list of themes can be found in help information.")
    var theme: String?
    
    func run() throws {
        let game = Game()
        game.boardSize = size
        
        game.startGame()
        
//        if start && (size >= 10 && size <= 40) {
//            
//        } else {
//            print("O valor máximo do tabuleiro é de 40")
//        }
    }
}
