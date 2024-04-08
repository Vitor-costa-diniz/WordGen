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
    
    @Option(name: [.customLong("size")], help: "Custom board size, min 11 and max 26")
    var size: Int?
    
    @Option(name: .shortAndLong, help: "Select a theme. If none is selected, a theme will be chosen randomly.")
    var theme: String?
    
    mutating func run() throws {
        let game = Game()
        game.boardSize = size ?? 11
        game.choosenTheme = theme
        game.verifyChoosenTheme()
        
        if start && (size ?? 11 >= 11 && size ?? 11 <= 26) {
            if !game.themeIsEmpty {
                do {
                    try game.startGame()
                    
                    while start {
                        print("Type a word that you found: ",terminator: "")
                        let input = readLine()?.replacingOccurrences(of: " ", with: "") ?? ""
                        
                        game.printLine()
                        
                        game.checkWord(word: input)
                        game.gameOptions(option: input)
                        
                        game.wereAllWordsFinded()
                        
                        start = GameControl.shared.keepGame
                        
                        game.displayTheme()
                        game.displayWordProgress()
                        game.printCurrentGame()
                    }
                } catch {
                    start = false
                }
            }
        } else {
            print("The size for the board must be between 11 and 26")
        }
    }
}
