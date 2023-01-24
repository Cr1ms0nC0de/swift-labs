//
//  ViewController.swift
//  Voluntracker
//
//  Created by Wilkins, Nolan W on 1/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPassButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == loginButton  {
            segue.destination.navigationItem.title = usernameInput.text
        }
    }
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "createAccount", sender: nil)
    }
    
    @IBAction func forgotPassButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "forgotUserOrPass", sender: nil)
    }
}
