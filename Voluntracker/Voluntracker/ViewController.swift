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
    
    let defaults = UserDefaults.standard
    var users = [] as? [Person]
    var loggedInUser: Person = Person(user: "temp", pass: "temp", currHours: 0, tarHours: 0)!
    
    
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
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let data = defaults.data(forKey: "arr") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Person
                users = try decoder.decode([Person].self, from: data)
                
            }
            catch {
                print("Unable to Decode People (\(error))")
            }
            
            let username = usernameInput.text
            let password = passwordInput.text
            var peopleIterator = users?.makeIterator()
            var foundUser: Bool = false
            while let p = peopleIterator?.next(){
                if(p.username == username && p.password == password){
                    foundUser = true
                    loggedInUser = p
                }
                if foundUser{
                    usernameInput.text = ""
                    passwordInput.text = ""
                    performSegue(withIdentifier: "login", sender:loginButton)
                }
                else{
                    usernameInput.text = ""
                    passwordInput.text = ""
                    invalidAlert()
                }
            }
        }
        func invalidAlert()
        {
            let message = UIAlertController(title: "Invalid Username or Password", message: "Please try again", preferredStyle: .alert)
            func invalidPressed(){
                return
            }
            message.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in invalidPressed()}))
            
            self.present(message, animated: true, completion: nil)
        }
    }
}
