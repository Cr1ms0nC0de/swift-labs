//
//  ViewController.swift
//  Whack-a-Mole
//
//  Created by Wilkins, Nolan W on 8/29/22.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var timer2 = Timer()
    var btn = UIButton()
    var scoreButton = UIButton();
    var startButton = UIButton();
    var backgroundLabel = UILabel();
    var scoreLabel = UILabel();
    var screenWidth = 0
    var screenHeight = 0
    var score : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //screen size
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        //background label
        backgroundLabel.frame = CGRect(x: (screenWidth / 2) - ((screenWidth - 5) / 2), y: (screenHeight / 2) - ((screenHeight - 5) / 2), width: screenWidth - 5, height: screenHeight - 5)
        backgroundLabel.backgroundColor = UIColor.green
        //score label
        scoreLabel.isHidden = true
        scoreLabel.frame = CGRect(x: 50, y: 50, width: screenWidth, height: screenHeight / 10)
        scoreLabel.font = UIFont.systemFont(ofSize: 12)
        scoreLabel.text = "Score: \(score)"
        //score button
        scoreButton.isHidden = true
        scoreButton.frame = CGRect(x: 200, y: 400, width: 75, height: 50)
        scoreButton.setTitle("Hit me", for: .normal)
        scoreButton.setTitleColor(UIColor.black, for: .normal)
        scoreButton.backgroundColor = UIColor.brown
        scoreButton.addTarget(self, action: #selector(scoreButtonPressed(_:)), for: .touchUpInside)
        //start button
        startButton.frame = CGRect(x: screenWidth/2 - 50, y: screenHeight-200, width: 100, height: 100)
        startButton.setTitle("Start", for: .normal)
        startButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        startButton.addTarget(self, action: #selector(startButtonPressed(_:)), for: .touchUpInside)
        //add to subview
        view.addSubview(backgroundLabel)
        view.addSubview(scoreButton)
        view.addSubview(startButton)
        view.addSubview(scoreLabel)
        self.view = view
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func scoreButtonPressed(_ sender: Any) {
        score += 1
        scoreLabel.text = "Score: \(score)"
        scoreButton.frame.origin = CGPoint(x: Int.random(in: 0...(screenWidth - 75)), y: Int.random(in: 50...(screenHeight - 75)))
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
        timer2.invalidate()
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveMole), userInfo: nil, repeats: false)
    }
    
    @objc func timerFunction(_ sender: UIButton!){
        print("Game Over: Score = \(score)")
        scoreButton.isHidden = true
        scoreLabel.font = UIFont.systemFont(ofSize: 30)
        startButton.isHidden = false;
        
    }
    
    @objc func moveMole(){
        scoreButton.frame.origin = CGPoint(x: Int.random(in: 0...screenWidth - 50), y: Int.random(in: 0...screenHeight - 50))
        timer2.invalidate()
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveMole), userInfo: nil, repeats: false)
        if(score > 0){
            score -= 1
            scoreLabel.text = "Score: \(score)"
        }
        
    }
    
    @objc func startButtonPressed(_ sender: UIButton!) {
        score = 0
        scoreLabel.text = "Score: \(score)"
        scoreButton.isHidden = false
        scoreLabel.isHidden = false
        scoreLabel.frame = CGRect(x: 50, y: 50, width: screenWidth, height: screenHeight / 10)
        scoreLabel.font = UIFont.systemFont(ofSize: 12)
        scoreButton.frame.origin = CGPoint(x: Int.random(in: 0...screenWidth - 50), y: Int.random(in: 0...screenHeight - 50))
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
        timer2.invalidate()
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveMole), userInfo: nil, repeats: false)
        startButton.isHidden = true
    }
}

