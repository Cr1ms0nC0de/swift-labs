//
//  ViewController.swift
//  Wordle
//
//  Created by Wilkins, Nolan W on 4/5/23.
//

import UIKit

var dict = WordDictionary(word: "")
var colorList : [Int] = [0, 0, 0, 0, 0]
var currentLabelIndex : Int = 0
let wordLength : Int = 5
let guessAmount : Int = 6
var guessesLeft : Int = guessAmount-1
var firstTime : Bool = true
var usedLetters : [String] = []
class ViewController: UIViewController {
    
    @IBOutlet weak var usedLetterLabel: UILabel!
    @IBOutlet var allLetters: [Letter]!
    @IBOutlet weak var wordField: WordleEntry!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func wordEntered(_ sender: Any) {
        let wordEntered = wordField.text!.uppercased()
        wordField.text = ""
        
        if wordEntered.count == wordLength{
            wordCheck(guess: wordEntered)
        }
        else{
            wordField.shake()
        }
    }
    
    func wordCheck(guess : String){
        var tempList : [Int] = [0, 0, 0, 0, 0]
        let originalGuessArray = guess.split(separator: "")
        var guessArray = guess.split(separator: "")
        let correctWordArray = dict.correctWord.split(separator: "")
        
        if firstTime{
            // Used Letters Adder
            for i in [Int](0...guessArray.count-1){
                let index = correctWordArray.firstIndex(of: guessArray[i])
                if index == nil{
                    usedLetters.append(String(guessArray[i]))
                }
            }
            
            // Green Checker
            for i in [Int](0...guessArray.count-1){
                if guessArray[i] == correctWordArray[i]{
                    colorList[i] = 1
                    guessArray[i] = "&" // Prevents the yellow checker for mistaking a green for a yellow
                }
            }
            
            // Yellow Checker
            for i in [Int](0...guessArray.count-1){
                let index = correctWordArray.firstIndex(of: guessArray[i])
                if index != nil{
                    colorList[i] = 2
                }
            }
            firstTime = false
        }
        else{
            // Used Letters Adder
            for i in [Int](0...guessArray.count-1){
                let index = correctWordArray.firstIndex(of: guessArray[i])
                
                if index == nil{
                    usedLetters.append(String(guessArray[i]))
                }
            }
            // Green Checker
            for i in [Int](0...guessArray.count-1){
                if guessArray[i] == correctWordArray[i]{
                    tempList[i] = 1
                    guessArray[i] = "&" // Prevents the yellow checker for mistaking a green for a yellow
                }
            }
            
            // Yellow Checker
            for i in [Int](0...guessArray.count-1){
                let index = correctWordArray.firstIndex(of: guessArray[i])
                if index != nil{
                    tempList[i] = 2
                }
            }
            colorList.append(contentsOf: tempList)
        }
        if tempList == [1, 1, 1, 1, 1] || colorList == [1, 1, 1, 1, 1]{
            displayWinAlert()
        }
        else if guessesLeft > 0{
            guessesLeft -= 1
        }
        else{
            displayLoseAlert()
        }
        usedLetterInitializer()
        setLabels(colorList: colorList, guessArray: originalGuessArray)
    }
    func setLabels(colorList : [Int], guessArray : [String.SubSequence]){
        var currentGuessIndex : Int = 0
        
        for i in [Int](currentLabelIndex...currentLabelIndex+4){
            if colorList[i] == 1{
                allLetters[i].backgroundColor = UIColor.green            }
            if colorList[i] == 2{
                allLetters[i].backgroundColor = UIColor.yellow
            }
            allLetters[i].text = String(guessArray[currentGuessIndex])
            allLetters[i].flip()
            currentGuessIndex += 1
        }
        currentLabelIndex += 5
    }
    
    func usedLetterInitializer(){
        let tempList = Array(Set(usedLetters))
        var tempStr : String = ""
        
        for i in tempList{
            tempStr += " \(i) "
        }
        usedLetterLabel.text = tempStr
    }
    
    func alertPressed(){
        dict.setCorrectWord()
        
        colorList = [0, 0, 0, 0, 0]
        currentLabelIndex = 0
        firstTime = true
        usedLetters = []
        usedLetterLabel.text = ""
        
        for i in allLetters{
            i.text = ""
            i.backgroundColor = UIColor.lightGray
        }
        wordField.text = ""
        guessesLeft = guessAmount-1
    }
    
    func displayLoseAlert(){
        let dialogMessage = UIAlertController(title: "Game Over", message: "The Correct Word was \(dict.correctWord)", preferredStyle: .alert)
        dialogMessage.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in self.alertPressed()}))
        self.present(dialogMessage, animated: true, completion: nil)
    }
    func displayWinAlert(){
        let dialogMessage = UIAlertController(title: "You Won", message: "Congratulations", preferredStyle: .alert)
        dialogMessage.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in self.alertPressed()}))
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    @IBAction func resetPressed(_ sender: Any){
        alertPressed()
    }
}
