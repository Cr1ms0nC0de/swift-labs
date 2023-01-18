//
//  ViewController.swift
//  Stopwatch
//
//  Created by Wilkins, Nolan W on 1/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var timer2 = Timer()
    var startTimer = false
    var seconds = 10.0
    var counter = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButtonPushed(_ sender: Any) {
        if(startTimer == false){
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            startTimer = true
        }
    }
    @objc func timerFunction(){
        timer.invalidate()
    }
    @objc func updateCounter(){
        if counter > 0 && startTimer {
            counter -= 1
            numLabel.text = String(format: "%.1f", counter)
        }
        if counter == 0{
            timer2.invalidate()
        }
    }
}

