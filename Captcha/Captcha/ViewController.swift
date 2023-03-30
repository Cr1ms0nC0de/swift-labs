//
//  ViewController.swift
//  Captcha
//
//  Created by Wilkins, Nolan W on 3/22/23.
//

import UIKit
import AVFoundation

var imageList: [String] = []
var player: AVAudioPlayer!
let fm = FileManager.default
let path = Bundle.main.resourcePath!
let soundPath = "\(path)/Sounds/"
let imagePath = "\(path)/Images/"

class ViewController: UIViewController {
    
    @IBOutlet var imageViews: [CaptchaImageView]!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    var currentCorrectAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let sounds = try fm.contentsOfDirectory(atPath: soundPath)
            let images = try fm.contentsOfDirectory(atPath: imagePath)
            imageList = images
            soundList = sounds
        }
        catch{
            print("error")
        }
        for imageView in imageViews{
            let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
            imageView.addGestureRecognizer(tapGR)
            imageView.isUserInteractionEnabled = true
        }
        assignRandomImages()
        
//        for i in 0...100{
//            playAlarm()
//        }
    }
    func assignRandomImages()
    {
        let imagePath = "\(Bundle.main.resourcePath!)/Images/"
        var mixedList = imageList
        mixedList.shuffle()
        var index = 0
        for i in imageViews
        {
            i.image = UIImage(named: imagePath + mixedList[index])
            i.fileName = mixedList[index]
            index += 1
        }
        correctAnswerLabel.text = "Tap Image that contains\n\(getCorrectAnswer().dropLast(4))"
    }
    func getCorrectAnswer() -> String
        {
            var listOfImages: [String] = []
            
            for img in imageViews
            {
                listOfImages.append(img.fileName)
            }
            if(currentCorrectAnswer == ""){
                currentCorrectAnswer = listOfImages.randomElement()!
            }
            return currentCorrectAnswer
        }
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
            let image = sender.view as! CaptchaImageView
            print(image.fileName)
            if(image.fileName == getCorrectAnswer()){
                print("correct")
//                setupSound()
            }
            else{
                print("incorrect")
                currentCorrectAnswer = ""
                assignRandomImages()
            }
        }
    }
//    func setupSound(){
//        currentCorrectAnswer = ""
//        correctAnswerLabel.text = "Tap Image that contains"
//        playAudioButton.isHidden = false
//        do {
//            let sounds = try fm.contentsOfDirectory(atPath: soundPath)
//            soundList = sounds
//        }
//        catch {
//            print("Error")
//        }
//        assignRandomImages()
//    }
}
