//
//  File.swift
//
//
//  Created by Vitor Costa on 09/03/24.
//

import Foundation

class MatrizGenerator {
    private let matriz = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var boardSize: Int = 0
    var words: [Word] = []
    private var chosenWords: [String] = []
    var generatedMatriz: [[String]] = []
    
    func generateMatriz() {
        generatedMatriz = [[String]](repeating: [String](repeating: "", count: boardSize), count: boardSize)
        
        sortition()

        fillWordsArray()
        
        for var word in words {
            putWords(word: &word)
        }
        
        fillEmptySpace()
        
        printMatriz()
    }
    
    func printMatriz() {
        for l in 0...self.boardSize - 1 {
            for c in 0...self.boardSize - 1 {
                print("\(generatedMatriz[l][c]) ",terminator: "")
                usleep(10000)
            }
            print("")
        }
    }
}

extension MatrizGenerator {
    private func fillEmptySpace() {
        for l in 0..<boardSize {
            for c in 0..<boardSize {
                if (generatedMatriz[l][c]) == "" {
                    generatedMatriz[l][c] = String(matriz.randomElement()!)
                }
            }
        }
    }
    
    private func sortition() {
        let numWords: Int =  boardSize/2 + 3
        
        var mockMatriz: [String] = ["amora", "maçã", "banana", "abacaxi", "laranja", "morango", "uva", "limão", "pêssego", "melancia", "kiwi", "pera", "manga", "abacate", "melão", "caqui", "jabuticaba", "cereja", "framboesa", "goiaba", "figo", "batata", "cenoura", "alface", "tomate", "cebola", "abóbora", "mandioca", "beterraba", "brócolis"]
        
        mockMatriz = mockMatriz.shuffled()
        
        verifyWordsSize(words: mockMatriz, numWords: numWords)
        
        chosenWords = Array(chosenWords.prefix(numWords).map({$0.uppercased() }))
    }
    
    private func verifyWordsSize (words: [String], numWords: Int) {
        var word = ""
        var count: Int = 0
        
        while count <= numWords {
            word = words.randomElement()!
            if word.count < boardSize - 1 && !chosenWords.contains(word) {
                chosenWords.append(word)
                count += 1
            }
        }
    }
    
    private func fillWordsArray() {
        for word in chosenWords {
            let wordPostion = position(palavrainfo: word)
            words.append(Word(name: word, wasFound: false, initPosition: wordPostion.0, lastPosition: wordPostion.1 , orientation: wordPostion.2))
        }
    }
}
