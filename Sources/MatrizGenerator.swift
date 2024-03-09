//
//  File.swift
//  
//
//  Created by Vitor Costa on 09/03/24.
//

import Foundation

class MatrizGenerator {
    private let matriz = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
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
