//
//  File.swift
//  
//
//  Created by Vitor Costa on 09/03/24.
//

import Foundation

class MatrizGenerator {
    private let matriz = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private var boardSize: Int = 0
    private var wordsSorted: [Word] = []
    private var generatedMatriz: [[String]] = []
    
    func generateMatriz(size: Int) {
        self.boardSize = size
        var count = 0

        generatedMatriz = [[String]](repeating: [String](repeating: "", count: size), count: size)
        
        setWords()
        
        print("Posição inicial: \(wordsSorted[0].initPosition)")
        print("Posição final: \(wordsSorted[0].lastPosition)")
        
        let rangeCollunm = wordsSorted[0].initPosition[1]...wordsSorted[0].lastPosition[1]
        let characters = Array(wordsSorted[0].word)
        
        for l in 0...size - 1 {
            for c in 0...size - 1 {
                if (l == wordsSorted[0].initPosition[0] && l == wordsSorted[0].lastPosition[0]) && rangeCollunm.contains(c) {
                    generatedMatriz[l][c] = String(characters[count])
                    count += 1
                }
                
                if generatedMatriz[l][c] == "" {
                    generatedMatriz[l][c] = String(matriz.randomElement()!)
                    if count != 0 {
                        count = 0
                    }
                }
            }
        }
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
    private func setWords() {
        let words = ["FUTEBOL"]
        
        for element in words {
            var helper = Word()
            helper.word = element
            helper.initPosition = sortPosition(word: helper, firstPosition: true)
            helper.lastPosition = sortPosition(word: helper, firstPosition: false)
            wordsSorted.append(helper)
        }
    }
    
    private func sortPosition(word: Word, firstPosition: Bool) -> [Int] {
        if firstPosition {
            let l: Int = Int.random(in: 0..<boardSize)
            let c: Int = Int.random(in: 0..<boardSize - word.word.count + 1)

            return [l,c]
            
        } else {
            let initPostionArray = word.initPosition
            let l: Int = initPostionArray[0]
            let c: Int = initPostionArray[1] - 1 + word.word.count
            if c >= boardSize {
                return sortPosition(word: word, firstPosition: true)
            }
            return [l,c]
        }
    }
}
