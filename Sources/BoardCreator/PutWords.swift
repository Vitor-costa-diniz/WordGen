//
//  File.swift
//  
//
//  Created by Vitor Costa on 21/03/24.
//

import Foundation

typealias Direction = ([Int], [Int], Orientation)

extension MatrizGenerator {
    func position (palavrainfo: String, direction: Orientation? = nil) -> Direction {
        var tuplePosi: Direction
        var fit: Bool = false
        let wordDirection: Orientation = [direction ?? .horizontal, direction ?? .vertical].randomElement()!
        let wordSize = palavrainfo.count
        
        while !fit {
            let line: Int = Int.random(in: 0..<boardSize)
            let column: Int = Int.random(in: 0..<boardSize)
            if wordDirection == .horizontal && (column < boardSize - wordSize - 1) {
                tuplePosi.0 = [line, column]
                tuplePosi.2 = wordDirection
                tuplePosi.1 = [line, column + palavrainfo.count - 1]
                fit = true
                return tuplePosi
            } else if wordDirection == .vertical && (line < boardSize - wordSize - 1) {
                tuplePosi.0 = [line, column]
                tuplePosi.1 = [line + palavrainfo.count - 1, column]
                tuplePosi.2 = wordDirection
                fit = true
                return tuplePosi
            }
        }
    }
    
    private func putWords(word: inout Word) {
        
    }
    
    func verifyPosition(word: Word) -> Bool {
        let line = word.initPosition[0]
        let column = word.initPosition[1]
        let wordSize = word.name.count
        var putLetter = 0
        var count = 0
        switch word.orientation {
        case .horizontal:
            for _ in column..<column + wordSize {
                if generatedMatriz[line][column + count] == "" || generatedMatriz[line][column + count] == String(Array(word.name)[count]) {
                    putLetter += 1
                }
                count += 1
            }
            return putLetter == wordSize
        case .vertical:
            for _ in line..<line + wordSize {
                if generatedMatriz[line + count][column] == "" || generatedMatriz[line + count][column] == String(Array(word.name)[count]) {
                    putLetter += 1
                }
                count += 1
            }
            return putLetter == wordSize
        }
    }
}
