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
        
        //Organizar elementos por quem aparece primeiro
        self.wordsSorted = wordsSorted.sorted { word1, word2 in
            if word1.initPosition[0] == word2.initPosition[0] {
                return word1.initPosition[1] < word2.initPosition[1]
            } else {
                return word1.initPosition[0] < word2.initPosition[0]
            }
        }
        
        var wordCount = 0
        
        var rangeCollunm = wordsSorted[wordCount].initPosition[1]...wordsSorted[wordCount].lastPosition[1]
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
                        wordCount += 1
                        rangeCollunm = wordsSorted[wordCount].initPosition[1]...wordsSorted[wordCount].lastPosition[1]
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
        let words = ["FUTEBOL","CEARA","CASTELAO"]
        
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
            var l: Int
            var c: Int
            
            repeat {
                l = Int.random(in: 0..<boardSize)
                c = Int.random(in: 0..<boardSize - word.word.count + 1)
            } while isPositionOccupied([l, c])
            
            return [l, c]
        } else {
            let initPositionArray = word.initPosition
            var l: Int = initPositionArray[0]
            var c: Int = initPositionArray[1] - 1 + word.word.count
            
            while isPositionOccupied([l, c]) {
                l = Int.random(in: 0..<boardSize)
                c = Int.random(in: 0..<boardSize - word.word.count + 1)
            }
            
            return [l, c]
        }
    }
    
    private func isPositionOccupied(_ position: [Int]) -> Bool {
        // Verifique se a posição já está ocupada por uma palavra
        return wordsSorted.contains { word in
            return position[0] >= word.initPosition[0] && position[0] <= word.lastPosition[0] &&
            position[1] >= word.initPosition[1] && position[1] <= word.lastPosition[1]
        }
    }
}
