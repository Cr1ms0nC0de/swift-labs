//
//  ViewController.swift
//  ISpy
//
//  Created by Wilkins, Nolan W on 4/17/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pufferfish: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pufferfish.frame.origin = CGPoint(x: 1, y: 1)
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        pufferfish.addGestureRecognizer(tapGR)
        pufferfish.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        print("Pufferfish")
    }
}

