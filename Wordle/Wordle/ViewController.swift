//
//  ViewController.swift
//  Wordle
//
//  Created by Wilkins, Nolan W on 4/5/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wordInput: UITextField!
    let dict = WordDictionary(word: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
