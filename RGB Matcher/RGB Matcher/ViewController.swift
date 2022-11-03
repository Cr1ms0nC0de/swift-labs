//
//  ViewController.swift
//  RGB Matcher
//
//  Created by Wilkins, Nolan W on 10/26/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var sliders: [UISlider]!
    @IBOutlet weak var guessColor: UILabel!
    @IBOutlet weak var actualColor: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var timer2 = Timer()
    var startTimer = false
    var seconds = 10
    var counter = 10
    var guessRGB = [CGFloat(0),CGFloat(0),CGFloat(0)]
    var actualRGB = [CGFloat(0),CGFloat(0),CGFloat(0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessColor.layer.borderColor = UIColor.black.cgColor
        guessColor.layer.borderWidth = 2
        
        actualColor.layer.borderColor = UIColor.black.cgColor
        actualColor.layer.borderWidth = 2
        
        for i in sliders{
            i.addTarget(self, action: #selector(sliderChanged(_:)), for: .allTouchEvents)
            guessRGB[i.tag] = CGFloat(i.value)
        }
        for i in 0...2{
            actualRGB[i] = CGFloat.random(in: CGFloat(0.0)...CGFloat(1.0))
        }
        guessColor.backgroundColor = UIColor(red: guessRGB[0], green: guessRGB[1], blue: guessRGB[2], alpha: 1.0)
        actualColor.backgroundColor = UIColor(red: actualRGB[0], green: actualRGB[1], blue: actualRGB[2], alpha: 1.0)
        timerLabel.text = "Time Left: \(seconds)"
        counter = seconds
    }
    @IBAction func sliderChanged(_ sender: UISlider){
        if(startTimer == false){
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        startTimer = true
        guessRGB[sender.tag] = CGFloat(sender.value)
        guessColor.backgroundColor = UIColor(red: guessRGB[0], green: guessRGB[1], blue: guessRGB[2], alpha: 1.0)
        
    }
    @objc func timerFunction(){
        timer.invalidate()
        
        let dialogMessage = UIAlertController(title: "Game Over!", message: "Score: \(calcScore())", preferredStyle: .alert)
        let restart = UIAlertAction(title: "Restart", style: .default, handler: { [self] (action) -> Void in
            for i in sliders{
                i.value = 0.5
                guessRGB[i.tag] = CGFloat(i.value)
            }
            for i in 0...2{
                actualRGB[i] = CGFloat.random(in: CGFloat(0.0)...CGFloat(1.0))
            }
            guessColor.backgroundColor = UIColor(red: guessRGB[0], green: guessRGB[1], blue: guessRGB[2], alpha: 1.0)
            actualColor.backgroundColor = UIColor(red: actualRGB[0], green: actualRGB[1], blue: actualRGB[2], alpha: 1.0)
            timerLabel.text = "Time Left: \(seconds)"
            counter = seconds
            startTimer = false
          })
        dialogMessage.addAction(restart)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    @objc func updateCounter(){
        if counter > 0 && startTimer {
            counter -= 1
            timerLabel.text = "Time Left: \(counter)"
        }
        if counter == 0{
            timer2.invalidate()
        }
            
    }
    func calcScore() -> Int{
        let rDiff = actualRGB[0] - guessRGB[0]
        let gDiff = actualRGB[1] - guessRGB[1]
        let bDiff = actualRGB[2] - guessRGB[2]
        let diff = sqrt(pow(rDiff, 2) + pow(gDiff, 2) + pow(bDiff, 2))
        return Int((CGFloat(1)-diff) * 100)
    }
}
