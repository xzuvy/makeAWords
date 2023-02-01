//
//  GameViewModule.swift
//  makeAWords
//
//  Created by Peter Clarke on 31.01.2023.
//

import Foundation

enum WordError : Error{
    case theSameWord
    case beforeWord
    case littleWord
    case wrongWord
    case undefinedError
}

class GameViewModule: ObservableObject {
    
    @Published var playerOne : Player
    @Published var playerTwo : Player
    @Published var words = [String]()
    
    let word: String
    var isFirst = true
    
    init(playerOne : Player, playerTwo: Player, word : String){
        
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.word = word.uppercased()
        
    }
    
    func validate(word: String) throws{
        
        let word = word.uppercased()
        guard word != self.word
        else{
            print("Составленное слово не должно быть с исходным словом")
            throw WordError.theSameWord
        }
        
        guard !(words.contains(word))
        else{
            print("Придумай слово которое не было составлено ранее")
            throw WordError.beforeWord
        }
        
        guard word.count > 1
        else{
            print("Слишком короткое слово")
            throw WordError.littleWord
        }
        
        return
        
    }
    
    func WordToChars(word : String) -> [Character] {
        
        var chars = [Character]()
        for char in word.uppercased() {
            chars.append(char)
            
        }
        
        return chars
        
        
    }
    
    func checkWord(word: String) throws -> Int {
        
        do{
            try self.validate(word: word)
        }
            catch{
                throw error
            }
        
        
        
                
        var bigWordArray = WordToChars(word: self.word)
        var smallWordArray = WordToChars(word: word)
        var result = ""
        
        for char in smallWordArray {
            
            if bigWordArray.contains(char){
                result.append(char)
                var i = 0
                while bigWordArray[i] != char{
                    i += 1
                }
                bigWordArray.remove(at: i)
            }
            else{
                throw WordError.wrongWord
            }
            
        }
        
        guard result == word.uppercased()
        else{
            print("Неизвестная ошибка")
            return 0
        }
        
        words.append(result)
        
        if isFirst {
            playerOne.score += result.count
        }
            else{
                playerTwo.score += result.count
            }
            isFirst.toggle()
            return result.count
        }
        
        
        
        
        
    
    
}
