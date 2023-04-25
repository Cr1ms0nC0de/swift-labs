//
//  WordDictionary.swift
//  Wordle
//
//  Created by Wilkins, Nolan W on 4/13/23.
//

import Foundation

class WordDictionary{
    var words: [String] = []
    var correctWord: String = ""
    var wordLength: Int = 5
    
    init(word: String) {
        if word != ""{
            correctWord = word
        }
        else{
            setupWords()
        }
    }
    func setupWords(){
        if let url = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let startWords = try? String(contentsOf: url) {
                words = startWords.components(separatedBy: "\n")
                setCorrectWord()
            }
        }
    }
    func setCorrectWord(){
        correctWord = words.randomElement()!
        if correctWord.count != wordLength{
            setCorrectWord()
        }
        print("Correct Word: \(correctWord)")
    }
}
