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
    var theme: String = ""
    var themeWords: [String] = []
    var words: [Word] = []
    private var chosenWords: [String] = []
    var generatedGrid: [[String]] = []
    
    ///Creates the grid that will arrange the words in the word search puzzle and the random letters in the empty spaces.
    func generateGrid() {
        ///Creates the initial grid with the size selected by the user and fills it with empty spaces.
        generatedGrid = [[String]](repeating: [String](repeating: "", count: boardSize), count: boardSize)
        
        sortition()

        fillWordsArray()
        
        ///Place each word in the grid
        for var word in words {
            putWords(word: &word)
        }
        
        fillEmptySpace()
    }
    
    func printMatriz() {
        for l in 0...self.boardSize - 1 {
            print("                         ", terminator: "")
            for c in 0...self.boardSize - 1 {
                print("\(generatedGrid[l][c]) ",terminator: "")
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
    
    /// Verifies if the word entered by the user is present in the array of words. If found, highlights the word in the grid.
    ///
    /// - Parameter triedWord: Word entered by the user
    /// Accent marks in the word are ignored during the check.
    func verifycaWords (triedWord: String) -> Bool {
        var wordFound: Bool = false
        for word in words {
            if word.name.isEqualIgnoringAccents(triedWord.uppercased()) {
                if let index = words.firstIndex(where: { $0.name == word.name }) {
                    words[index].wasFound = true
                }
                highlightWord(word)
                wordFound = true
            }
        }
        return wordFound
    }
    
    /// Highlights a random letter in blue from a random word that has not been found yet.
    func showHint() {
        let unfoundWords = words.filter { !$0.wasFound }
        guard let word = unfoundWords.randomElement() else { return }
        let wordSize = word.name.count
        
        let line = word.initPosition[0]
        let column = word.initPosition[1]
        
        switch word.orientation {
        case .horizontal:
            let randomLetter = Int.random(in: 0..<wordSize)
            generatedGrid[line][column + randomLetter] = String(Array(word.name)[randomLetter]).blue
            
        case .vertical:
            let randomLetter = Int.random(in: 0..<wordSize)
            generatedGrid[line + randomLetter][column] = String(Array(word.name)[randomLetter]).blue
        }
    }
    
    /// Highlights all the words in the game for the user and terminates the program execution.
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
                    generatedGrid[line][colunm + letter] = generatedGrid[line][colunm + letter].green
                    letter += 1
                }
                
            case .vertical:
                for _ in line..<line + wordSize {
                    generatedGrid[line + letter][colunm] = generatedGrid[line + letter][colunm].green
                    letter += 1
                }
            }
        }
    }
    
    ///Terminates the program execution.
    func exitGame() {
        var quit: String
        repeat {
            print("TEM CERTEZA QUE QUER SAIR?".red.bold, terminator: "")
            print("(S/N)".bold, terminator: " ")
            quit = readLine()?.uppercased() ?? ""
            
            switch quit {
            case "S":
                GameControl.shared.keepGame = false
                print("\(Constants.UseCases.quit)".yellow)
                print("")
            case "N":
                quit = "S"
            default:
                print("Resposta inválida")
            }
        } while quit != "S"
    }
}

extension MatrizGenerator {
    /// It fills the empty spaces left after all the words have already been placed in the game with random letters from the alphabet.
    private func fillEmptySpace() {
        for l in 0..<boardSize {
            for c in 0..<boardSize {
                if (generatedGrid[l][c]) == "" {
                    generatedGrid[l][c] = String(matriz.randomElement()!)
                }
            }
        }
    }

    ///Randomly selects the theme and the words that will be present in the game.
    private func sortition() {
        let numWords: Int = (boardSize/2 + 3) + ((boardSize * boardSize) / 50)

        var mockMatriz: [String] = Constants.mockThemes[theme] ?? [""]

        mockMatriz = mockMatriz.shuffled()
        
        verifyWordsSize(words: mockMatriz, numWords: numWords)
        
        chosenWords = Array(chosenWords.prefix(numWords).map({$0.uppercased() }))
    }
    
    ///Checks if the chosen word's length is less than or equal to the size of the matrix selected by the user and if the word has not been selected more than once.
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
    
    /// After selecting the words, an array of Word objects is assembled to facilitate future operations throughout the program.
    private func fillWordsArray() {
        for word in chosenWords {
            let wordPostion = position(palavrainfo: word)
            words.append(Word(name: word, wasFound: false, initPosition: wordPostion.0, lastPosition: wordPostion.1 , orientation: wordPostion.2))
        }
    }
    
    /// Changes the color in the grid for the spaces corresponding to the letters of this word to green.
    private func highlightWord(_ word: Word) {
        let line = word.initPosition[0]
        let colunm = word.initPosition[1]
        let wordSize = word.name.count
        var letter = 0
        
        switch word.orientation {
        case .horizontal:
            for _ in colunm..<colunm + wordSize {
                generatedGrid[line][colunm + letter] = generatedGrid[line][colunm + letter].green
                letter += 1
            }
            
        case .vertical:
            for _ in line..<line + wordSize {
                generatedGrid[line + letter][colunm] = generatedGrid[line + letter][colunm].green
                letter += 1
            }
        }
    }
}
