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
        generatedMatriz = [[String]](repeating: [String](repeating: "", count: size), count: size)
//        setWords(size: size)
        for l in 0...size - 1 {
            for c in 0...size - 1 {
                generatedMatriz[l][c] = String(matriz.randomElement()!)
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
    private func setWords(size: Int) {
        let words = ["FUTEBOL"]
        
        for element in words {
            var helper = Word()
            helper.word = element
            helper.initPosition = sortPosition(size: size, word: helper, firstPosition: true)
            helper.lastPosition = sortPosition(size: size, word: helper, firstPosition: false)
            wordsSorted.append(helper)
        }
    }
    
    private func sortPosition(size: Int, word: Word, firstPosition: Bool) -> [Int] {
        if firstPosition {
            let range: ClosedRange = (1...size)
            let l: Int = range.randomElement()!
            var c: Int = range.randomElement()!
            
            while c > word.word.count {
                c = range.randomElement()!
            }
            return [l,c]
        } else {
            let initPostionArray = word.initPosition
            let l: Int = initPostionArray[0]
            let c: Int = initPostionArray[1] + word.word.count
            return [l,c]
        }
    }
}
