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
}
