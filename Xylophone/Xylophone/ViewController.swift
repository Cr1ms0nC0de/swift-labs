//
//  ViewController.swift
//  Xylophone
//
//  Created by Wilkins, Nolan W on 11/7/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in buttons{
            i.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
            
        }
        // Do any additional setup after loading the view.
    }
        
    @IBAction func keyPressed(_ sender: UIButton){
        
        playSound(name: (sender.titleLabel?.text)!)
    }
    
    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
        
    
}
