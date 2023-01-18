//
//  ViewController.swift
//  Login
//
//  Created by Wilkins, Nolan W on 1/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var forgotUserButton: UIButton!
    @IBOutlet weak var forgotPassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPassButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == forgotUserButton {
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else {
            segue.destination.navigationItem.title = usernameInput.text
        }
    }
    @IBAction func forgotUserButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "forgotUserOrPass", sender: nil)
    }
    
    @IBAction func forgotPassButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "forgotUserOrPass", sender: nil)
    }
}
