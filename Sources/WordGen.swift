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
        
        Is a word search project that aims to save you in times of boredom,
        in addition to all the cognitive benefits that a word search already brings,
        generate a random word search puzzle among 5 themes.
        
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
    var size: Int?
    
    mutating func run() throws {
        let game = Game()
        game.boardSize = size ?? 11
        
        if start && (size ?? 11 >= 11 && size ?? 11 <= 40) {
            game.startGame()
            
            while start {
                print("Digite uma palavra que você achou: ",terminator: "")
                let input = readLine()?.replacingOccurrences(of: " ", with: "") ?? ""

                game.checkWord(word: input)
                game.gameOptions(option: input)
                
                start = game.wereAllWordsFinded()
                
                game.displayWordProgress()
                game.printCurrentGame()
            }
        } else {
            print("O tamanho para o tabuleiro tem que ser entre 11 e 40")
        }
    }
}
