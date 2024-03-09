//
//  File.swift
//  
//
//  Created by Vitor Costa on 09/03/24.
//

import Foundation

class MatrizGenerator {
    private let matriz = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private let wordsSorted: [Word] = []
    
    func generateMatriz(size: Int) {
        for _ in 1...size {
            for _ in 1...size {
                print("\(matriz.randomElement()!) ", terminator: "")
                usleep(10000)
            }
            print("")
        }
    }
}

extension MatrizGenerator {
    private func setWords(size: Int) {
        let words = ["Futebol", "Nordeste",
            "Ceara", "Ferroviario","Gols",
            "Castelao", "Bahia", "Recife"]
        
        for element in words {
            var helper = Word()
            helper.word = element
            helper.initPosition = sortPosition(size: size, wordSize: element.count, last: false)
        }
    }
    
    private func sortPosition(size: Int, wordSize: Int, last: Bool) -> [Int] {
        let range: ClosedRange = (0...size)
        let l = range.randomElement()!
        var c = range.randomElement()!
        
        while c > wordSize {
            c = range.randomElement()!
        }

        return [l,c]
    }
}

struct Word {
    var word: String = ""
    // Linha x Coluna
    var initPosition: [Int] = []
    // Linha x Coluna
    var lastPosition: [Int] = []
}
