//
//  CreateAccountVC.swift
//  Voluntracker
//
//  Created by Wilkins, Nolan W on 1/20/23.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    let defaults = UserDefaults.standard
    
    var username : String = "Default"
    var password : String = "Default"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func usernameInputChanged(_ sender: UITextField) {
        username = sender.text ?? "ERROR"
    }
    
    @IBAction func passwordInputChanged(_ sender: UITextField) {
        password = sender.text ?? "ERROR"
    }
    
    @IBAction func createAccountButton(_ sender: UIButton) {
        if username != "" && password != ""{
            let person = [
                "username": username,
                "password": password,
                "currentHours": Int(0),
                "targetHours": Int(0)
            ] as [String : Any]
            defaults.set(person, forKey: username)
        }
    }
    
    @IBAction func unwindToLogIn(unwindSegue: UIStoryboardSegue) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
