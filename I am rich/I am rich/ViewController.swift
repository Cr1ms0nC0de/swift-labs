//
//  ViewController.swift
//  I am rich
//
//  Created by Wilkins, Nolan W on 8/25/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.tintColor = .clear
        label1.text = "I Am Rich"
        label1.textAlignment = .center
        label1.font = UIFont(name: "Baskerville", size: 30)
        view.backgroundColor = UIColor(red: 0.01171875, green: 0.40625, blue: 1.0, alpha: 1.0)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if(label1.text == "I Am Rich"){
            label1.text = "I Am Poor"
            label1.font = UIFont(name: "GillSans", size: 30)
            view.backgroundColor = UIColor(red: 0.03125, green: 0.984375, blue: 0.953125, alpha: 1.0)
        }
        else{
            label1.text = "I Am Rich"
            label1.font = UIFont(name: "Baskerville", size: 30)
            view.backgroundColor = UIColor(red: 0.01171875, green: 0.40625, blue: 1.0, alpha: 1.0)
        }
    }
}

