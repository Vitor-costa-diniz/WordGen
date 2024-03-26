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
    }
    
    func printMatriz() {
        for l in 0...self.boardSize - 1 {
            for c in 0...self.boardSize - 1 {
                print("\(generatedMatriz[l][c]) ",terminator: "")
                usleep(UInt32(10000/boardSize))
            }
            print("")
        }
    }
    /// Checks if the array of Word objects still contains words that have not been found.
    /// - RETURNS: `true` if there are still words to be found, otherwise returns `false`.
    func verifyRemainWords() -> Bool {
        let remainingWordsCount = words.filter { !$0.wasFound }.count
        return remainingWordsCount > 0
    }
    
    func verificaWords (palavraTentada: String) {
        for palavra in words {
            if palavra.name.isEqualIgnoringAccents(palavraTentada.uppercased()) {
                if let index = words.firstIndex(where: { $0.name == palavra.name }) {
                    words[index].wasFound = true
                }
                pintaPalavra(word: palavra)
            }
        }
    }
    
    func showHint() {
        let unfoundWords = words.filter { !$0.wasFound }
        guard let word = unfoundWords.randomElement() else { return }
        let wordSize = word.name.count
        
        let line = word.initPosition[0]
        let column = word.initPosition[1]
        
        // Começar a colar a palavra
        switch word.orientation {
        case .horizontal:
            let randomLetter = Int.random(in: 0..<wordSize)
            generatedMatriz[line][column + randomLetter] = String(Array(word.name)[randomLetter]).blue
            
        case .vertical:
            let randomLetter = Int.random(in: 0..<wordSize)
            generatedMatriz[line + randomLetter][column] = String(Array(word.name)[randomLetter]).blue
        }
    }
    
    func resolveGame() {
        for word in words {
            let line = word.initPosition[0]
            let colunm = word.initPosition[1]
            let wordSize = word.name.count
            var letter = 0
            
            switch word.orientation {
                // Começar a colar a palavra
            case .horizontal:
                for _ in colunm..<colunm + wordSize {
                    generatedMatriz[line][colunm + letter] = generatedMatriz[line][colunm + letter].green
                    letter += 1
                }
                
            case .vertical:
                for _ in line..<line + wordSize {
                    generatedMatriz[line + letter][colunm] = generatedMatriz[line + letter][colunm].green
                    letter += 1
                }
            }
            if let index = words.firstIndex(where: { $0.name == word.name }) {
                words[index].wasFound = true
            }
        }
    }
    
    func exitGame() {
        for word in words {
            if let index = words.firstIndex(where: { $0.name == word.name }) {
                words[index].wasFound = true
            }
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
    
    private func pintaPalavra(word: Word) {
        let line = word.initPosition[0]
        let colunm = word.initPosition[1]
        let wordSize = word.name.count
        var letter = 0
        
        switch word.orientation {
            // Começar a colar a palavra
        case .horizontal:
            for _ in colunm..<colunm + wordSize {
                generatedMatriz[line][colunm + letter] = generatedMatriz[line][colunm + letter].green
                letter += 1
            }
            
        case .vertical:
            for _ in line..<line + wordSize {
                generatedMatriz[line + letter][colunm] = generatedMatriz[line + letter][colunm].green
                letter += 1
            }
        }
    }
}
