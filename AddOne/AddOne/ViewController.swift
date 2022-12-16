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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.jpg")!)
        numberLabel.text = "\(Int.random(in: 1000...9999))"
    }
    @IBAction func inputFieldChanged(_ sender: UITextField) {
        guard let num = Int(inputField.text!) else{
            return
        }
        guard inputField.text!.count == 4 else{
            return
        }
        guard var requiredNum = Int(numberLabel.text!) else{
            return
        }
        let input = numberLabel.text
        for i in 0...input!.count{
            let char = input![input!.index(input!.startIndex, offsetBy: i)]
            guard Int(String(char)) == 9 else{
                return
            }
        }
            
        if(num == Int(numberLabel.text!)){
            
        }
    }
}

