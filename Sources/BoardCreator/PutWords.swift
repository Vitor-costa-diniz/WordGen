//
//  File.swift
//  
//
//  Created by Vitor Costa on 21/03/24.
//

import Foundation

/// A type representing the position and orientation of a word.
typealias Direction = ([Int], [Int], Orientation)

extension MatrizGenerator {
    /// Responsible for randomly selecting a position for the word and also responsible for
    /// selecting the word's orientation, whether it will be horizontal or vertical.
    ///
    /// First, the word's orientation is randomly selected. Then, a while loop is executed in which a row and a column are randomly selected,
    /// and depending on the orientation, a check is made to see if the word, at that position, does not exceed the size of the grid.
    /// If it exceeds, another row and column are randomly selected, and this process repeats until it fits within the size of the grid.
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
    
    /// Responsible for verifying if the word can be placed in the randomly selected position before placing the word.
    /// - Parameter word: The word to be verified.
    /// - Returns: `true` if the word can be placed in that matrix space; otherwise, `false`.
    ///
    /// It first creates variables to store the initial row and column values of that word.
    /// Then variables are created to control the execution of the for loop.
    /// A switch-case is used on the word's orientation to determine if the count will increase in the column or row.
    /// For both cases, two checks are performed:
    /// 1. If the value at that position is empty.
    /// 2. If the letter at that position in the matrix is equal to the same letter at the current index of the word chosen to be placed.
    ///
    /// If both checks are true, it increments the value of `putLetter` by 1.
    /// At the end of the loop, the comparison between `putLetter` and the size of the word is returned. If they are equal, it means the word can be placed in that space.
    
    private func verifyPosition(_ word: Word) -> Bool {
        let line = word.initPosition[0]
        let column = word.initPosition[1]
        let wordSize = word.name.count
        /// The variable `putLetter` is the "theoretical" counter indicating whether that letter of the word can be placed in that space.
        var putLetter = 0
        /// The variable `count` is the counter of the number of times the loop has iterated.
        ///
        /// We cannot use the loop variable directly because it ranges from the initial row/column value to the final position value.
        ///
        /// Therefore, it may start from 2, 3, and so on. If we were to use this value as an index in the word's array, it would result in an "index out of range" error, as the array index ranges from 0 to (N-1) elements in the array.
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
