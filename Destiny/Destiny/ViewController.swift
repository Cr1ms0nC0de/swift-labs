//
//  ViewController.swift
//  Destiny
//
//  Created by Wilkins, Nolan W on 9/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var roomDesc: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    var game = Destiny()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true;
        roomDesc.text = game.stories[game.currentStory].title
        leftButton.setTitle(game.stories[game.currentStory].choice1, for: .normal)
        rightButton.setTitle(game.stories[game.currentStory].choice2, for: .normal)
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        game.currentStory = game.stories[game.currentStory].choice1index
        roomDesc.text = game.stories[game.currentStory].title
        if(game.currentStory == 5){
            leftButton.isHidden = true;
            rightButton.isHidden = true;
            resetButton.isHidden = false;
        }
        else{
            
            leftButton.setTitle(game.stories[game.currentStory].choice1, for: .normal)
            rightButton.setTitle(game.stories[game.currentStory].choice2, for: .normal)
        }
        
        
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        game.currentStory = game.stories[game.currentStory].choice2index
        roomDesc.text = game.stories[game.currentStory].title
        if(game.currentStory == 2){
            leftButton.isHidden = true;
            rightButton.isHidden = true;
            resetButton.isHidden = false;
        }
        else{
            leftButton.setTitle(game.stories[game.currentStory].choice1, for: .normal)
            rightButton.setTitle(game.stories[game.currentStory].choice2, for: .normal)
        }
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        resetButton.isHidden = true;
        leftButton.isHidden = false;
        rightButton.isHidden = false;
        game.currentStory = 0;
        roomDesc.text = game.stories[game.currentStory].title
        leftButton.setTitle(game.stories[game.currentStory].choice1, for: .normal)
        rightButton.setTitle(game.stories[game.currentStory].choice2, for: .normal)
    }
}

