//
//  ViewController.swift
//  AddOne
//
//  Created by Wilkins, Nolan W on 12/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    var timer = Timer()
    var timer2 = Timer()
    var startTimer = false
    var seconds = 10
    var counter = 10
    
    var score: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.jpg")!)
        numberLabel.text = "\(Int.random(in: 1000...9999))"
        
    }
    
    
    @IBAction func inputFieldChanged(_ sender: UITextField) {
        if(startTimer == false){
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        startTimer = true
        guard let num = Int(inputField.text!) else{
            inputField.text = ""
            return
        }
        guard inputField.text!.count == 4 else{
            return
        }
        let input = numberLabel.text
        var output: String = ""
        var outputChar: Int = 0
        for i in 0...input!.count-1{
            let char = input![input!.index(input!.startIndex, offsetBy: i)]
            outputChar = Int(String(char))!
            if Int(String(char)) == 9{
                outputChar = 0
            }
            else{
                outputChar += 1
            }
            output.append(String(outputChar))
        }
        if(num == Int(output)){
            numberLabel.text = "\(Int.random(in: 1000...9999))"
            score += 1
            scoreLabel.text = String(score)
            inputField.text = ""
        }
        else{
            numberLabel.text = "\(Int.random(in: 1000...9999))"
            score -= 1
            scoreLabel.text = String(score)
            inputField.text = ""
        }
    }
    
    @objc func timerFunction(){
        timer.invalidate()
        
        let dialogMessage = UIAlertController(title: "Game Over!", message: "Score: \(score)", preferredStyle: .alert)
        let restart = UIAlertAction(title: "Restart", style: .default, handler: { [self] (action) -> Void in
            numberLabel.text = "\(Int.random(in: 1000...9999))"
            score = 0;
            scoreLabel.text = String(score)
            inputField.text = ""
            timeLabel.text = "\(seconds)"
            counter = seconds
            startTimer = false
          })
        dialogMessage.addAction(restart)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    @objc func updateCounter(){
        if counter > 0 && startTimer {
            counter -= 1
            timeLabel.text = "\(counter)"
        }
        if counter == 0{
            timer2.invalidate()
        }
    }
}
