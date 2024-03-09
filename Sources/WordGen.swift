//
//  File.swift
//
//
//  Created by Vitor Costa on 07/03/24.
//
import ArgumentParser
import Foundation

struct WordGen: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "wordgen",
        abstract: """
Is a customizable word search projetc that aims to save you in times
of boredom,in addition to all the cognitive benefits that a word search already
brings, we also make it simple to the user make his own word search themed game.
""")
    @Flag(name: [.customLong("start")], help: "Start game")
    var start: Bool = false
    
    @Option(name: [.customLong("size")], help: "Custom board size, min 10x10 and max 40x40")
    var size: Int?
    
    @Option(name: .long, help: "Choose a language between Portuguese and English.")
    var language: String?
    
    @Option(name: .shortAndLong, help: "Choose a theme from thise available, the list of themes can be found in help information.")
    var theme: String?
    
    func run() throws {
        if start && (size ?? 10 >= 10 && size ?? 10 <= 40) {
            print("BOARD SIZE SELECTED BY USER: \(String(describing: size))")
            print("")
            startGame(size: size ?? 10)
        } else {
            print("O seu animal o máximo é 40 PORRRAAAAA")
        }
    }
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
    
    let matriz = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    let greenText = "\u{001B}[0;32m\(wordGen)\u{001B}[0m"
    print(greenText)
    
    print("")
    print("")
    
    
    for _ in 1...size {
        for _ in 1...size {
            print("\(matriz.randomElement()!) ", terminator: "")
            usleep(10000)
        }
        print("")
    }
}
