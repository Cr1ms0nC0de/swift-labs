//
//  ViewController.swift
//  Magic 8-Ball
//
//  Created by Wilkins, Nolan W on 9/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shake: UILabel!
    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var timer2 = Timer()
    var random : Int = 0
    var canShake : Bool = true
    
    var responses = ["It is certain.", "It is decidely so.", "Without a doubt.", "Yes definetly.", "You may rely on it.", "As I see it, yes", "Most Likely", "Outlook good.", "Yes.", "Signs point to yes.", "Reply hazy, try again.", "Ask again later.", "Better not tell you now", "Cannot predict now.", "Concetrate and ask again.", "Don't count on it.", "My reply is no.", "Outlook not so good.", "Very doubtful"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Think of a question..."
        // Do any additional setup after loading the view.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake && canShake{
            canShake = false;
            label.text = "";
            shake.text = ""
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: false)
        }
    }
    @objc func timerFunction(_ sender: UIButton!){
        canShake = false;
        shake.text = ""
        random = Int.random(in: 0...responses.count-1)
        label.text = responses[random]
        timer2.invalidate()
        timer2 = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timer2Function), userInfo: nil, repeats: false)
    }
    @objc func timer2Function(_ sender: UIButton!){
        label.text = "Think of a question..."
        shake.text = "Shake Me"
        canShake = true;
    }
}


