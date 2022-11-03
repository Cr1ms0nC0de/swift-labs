//
//  ViewController.swift
//  IBBasics
//
//  Created by Wilkins, Nolan W on 8/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.tintColor = .red
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        label.text = "pog"
        label.textColor = .cyan
        print("pog")
    }
    
}

