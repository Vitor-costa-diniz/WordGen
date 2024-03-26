//
//  File.swift
//  
//
//  Created by Vitor Costa on 21/03/24.
//

import Foundation

typealias Direction = ([Int], [Int], Orientation)

extension MatrizGenerator {
    func position (palavrainfo: String) -> Direction {
        var tuplePosi: Direction
        var fit: Bool = false
        let wordDirection: Orientation = [.horizontal, .vertical].randomElement()!
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
    
    func putWords(word: inout Word) {
        var line = word.initPosition[0]
        var column = word.initPosition[1]
        let wordSize = word.name.count
        var letter = 0
        var permittedPosition = verifyPosition(word)
        // Verifica a posição para ver se ta ok
        while !permittedPosition {
            switch word.orientation {
            case .horizontal:
                let newPositions = position(palavrainfo: word.name)
                word.initPosition = newPositions.0
                word.lastPosition = newPositions.1
                word.orientation = newPositions.2
                
                line = word.initPosition[0]
                column = word.initPosition[1]
                
                if let index = words.firstIndex(where: { $0.name == word.name }) {
                    words[index] = word
                }
                permittedPosition = verifyPosition(word)

            case .vertical:
                let newPositions = position(palavrainfo: word.name)
                word.initPosition = newPositions.0
                word.lastPosition = newPositions.1
                word.orientation = newPositions.2
            
                if let index = words.firstIndex(where: { $0.name == word.name }) {
                    words[index] = word
                }
                permittedPosition = verifyPosition(word)
            }
        }
        
        line = word.initPosition[0]
        column = word.initPosition[1]
        
        // Começar a colar a palavra
        switch word.orientation {
        case .horizontal:
            for _ in column..<column + wordSize {
                generatedGrid[line][column + letter] = String(Array(word.name)[letter])
                letter += 1
            }
            
        case .vertical:
            for _ in line..<line + wordSize {
                generatedGrid[line + letter][column] = String(Array(word.name)[letter])
                letter += 1
            }
        }
    }
    
    private func verifyPosition(_ word: Word) -> Bool {
        let line = word.initPosition[0]
        let column = word.initPosition[1]
        let wordSize = word.name.count
        var putLetter = 0
        var count = 0

        switch word.orientation {
        case .horizontal:
            for _ in column..<column + wordSize {
                if generatedGrid[line][column + count] == "" || generatedGrid[line][column + count] == String(Array(word.name)[count]) {
                    putLetter += 1
                }
                count += 1
            }
            return putLetter == wordSize
        case .vertical:
            for _ in line..<line + wordSize {
                if generatedGrid[line + count][column] == "" || generatedGrid[line + count][column] == String(Array(word.name)[count]) {
                    putLetter += 1
                }
                count += 1
            }
            return putLetter == wordSize
        }
    }
}
