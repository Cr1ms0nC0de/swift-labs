//
//  AudioVC.swift
//  Captcha
//
//  Created by Wilkins, Nolan W on 3/30/23.
//

import UIKit
import AVFoundation

var soundList: [String] = []
var currentAnswer: String = ""
var currentAnswerName: String = ""
var randomIndex: Int = 0
var correctAnswer: String = ""

class AudioVC: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var audioButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let soundPath = "\(path)/Sounds/"
        do{
            let sounds = try fm.contentsOfDirectory(atPath: soundPath)
            soundList = sounds
            
        }
        catch{
            print("\nError\n")
        }
        for i in 0...3{
            answerButtons[i].addTarget(self, action: #selector(answerChoicePressed(_:)), for: .touchUpInside)
            answerButtons[i].backgroundColor = .blue
        }
        assignAnswer()
        assignButtons(flag: true)
    }
    func wavRemover(wavName: String) -> String{
        var j : String = wavName
        var index = j.firstIndex(of: ".")!
        j = j.substring(to: index)
        return j
    }
    func fileToName(file:String) -> String{
        var j : String = file
        var index = j.firstIndex(of: "_")!
        j = j.substring(from: index)
        index = j.firstIndex(of: ".")!
        j = j.substring(to: index)
        j.removeFirst()
        return j
    }
    func playSound(name: String){
        let soundDirectory = "/Sounds/\(name)"
        let url = Bundle.main.url(forResource: soundDirectory, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func getAudioFilePath(audioFile: String) -> String{
        var t = "/Sounds/\(audioFile)"
        t.removeLast(4)
        return t
    }
    func assignButtons(flag: Bool){
        var j = 0
        for i in answerButtons{
            let text = fileToName(file: soundList[j])
            i.setTitle(text, for: .normal)
            j+=1
        }
        print("\nJ value: \(j)\n")
        if !flag{
            soundList.removeFirst(4)
        }
        print("\nUpdated Sound List: \(soundList)\n")
    }
    func assignAnswer(){
        randomIndex = Int.random(in: 0 ... 3)
        correctAnswer = soundList[randomIndex]
    }
    @objc func answerChoicePressed(_ sender: UIButton!){
        let pickedAnswer : String = sender.currentTitle!
        print("\nSender title: \(pickedAnswer)\n")
        print("\nCorrect Answer: \(fileToName(file: correctAnswer))\n")
        let validity = checkAnswer(answer: pickedAnswer)
        if !validity{
//            sender.shake()
            performSegue(withIdentifier: "robot", sender: nil)
        }
        else{
            performSegue(withIdentifier: "human", sender: nil)
        }
    }
    
    @IBAction func playButtonPressed(_ sender: Any){
        playSound(name: wavRemover(wavName: correctAnswer))
    }
    func checkAnswer(answer : String) -> Bool{
        if answer == fileToName(file: correctAnswer){
            print("\ncorrect audio pressed\n")
            return true
        }
        else{
            print("\nincorrect audio pressed\n")
            return false
        }
    }
}
