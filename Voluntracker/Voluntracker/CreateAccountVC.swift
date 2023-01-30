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
            
            struct Person: Codable{
                let username: String
                let password: String
                var currentHours: Int
                let targetHours: Int
            }
            let person = Person(username: username, password: password, currentHours: 0, targetHours: 0)
            var people = defaults.object(forKey: "arr") as? [Person] ?? []
            do {
                people.append(person)
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Note
                var data = try encoder.encode(people)
                
                
                
                // Write/Set Data
               defaults.set(data, forKey: "arr")
                print(data.count)

            } catch {
                print("Unable to Encode Array of People (\(error))")
            }
            
            
            if let data = defaults.data(forKey: "arr") {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                    let people = try decoder.decode([Person].self, from: data)
                    

                } catch {
                    print("Unable to Decode Notes (\(error))")
                }
            }
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
