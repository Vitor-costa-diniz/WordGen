//
//  File.swift
//
//
//  Created by Vitor Costa on 09/03/24.
//

import Foundation
import Rainbow

class PrintStatements {
    func printInGameOptions() {
        print("""
    IN GAME OPTIONS:
    --hint          Highlights a letter of a word that has not been found yet.
    --resolve       Resolve game.
    --exit          Exit the game.
    
    """)
    }
    
    func startGame() {
        let wordGen = """
                 _     _  _______  ______    ______   _______  _______  __    _
                | | _ | ||       ||    _ |  |      | |       ||       ||  |  | |
                | || || ||   _   ||   | ||  |  _    ||    ___||    ___||   |_| |
                |       ||  | |  ||   |_||_ | | |   ||   | __ |   |___ |       |
                |       ||  |_|  ||    __  || |_|   ||   ||  ||    ___||  _    |
                |   _   ||       ||   |  | ||       ||   |_| ||   |___ | | |   |
                |__| |__||_______||___|  |_||______| |_______||_______||_|  |__|
                """

        print(wordGen.green)
        
        print("")
        print("")
    }
    
    func printResolve() {
        print("\(Constants.UseCases.resolve)".green)
        print("")
    }
    
    func printHint() {
        print("\(Constants.UseCases.hint)".blue)
        print("")
    }
    
    func printWin() {
        print("\(Constants.UseCases.win)".green)
        print("")
    }

    func mamaco (){
        print(#"""

                                           ▒▒▒▒▒▄██████████▄▒▒▒▒▒
                                           ▒▒▒▄██████████████▄▒▒▒
                                           ▒▒██████████████████▒▒
                                           ▒▐███▀▀▀▀▀██▀▀▀▀▀███▌▒
                                           ▒███▒▒▌■▐▒▒▒▒▌■▐▒▒███▒
                                           ▒▐██▄▒▀▀▀▒▒▒▒▀▀▀▒▄██▌▒
                                           ▒▒▀████▒▄▄▒▒▄▄▒████▀▒▒
                                           ▒▒▐███▒▒▒▀▒▒▀▒▒▒███▌▒▒
                                           ▒▒███▒▒▒▒▒▒▒▒▒▒▒▒███▒▒
                                           ▒▒▒██▒▒▀▀▀▀▀▀▀▀▒▒██▒▒▒
                                           ▒▒▒▐██▄▒▒▒▒▒▒▒▒▄██▌▒▒▒
                                           ▒▒▒▒▀████████████▀▒▒▒▒
               
               """#)
    }
}
