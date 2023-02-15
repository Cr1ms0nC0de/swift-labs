//
//  CreateAccountVC.swift
//  Voluntracker
//
//  Created by Wilkins, Nolan W on 1/20/23.
//

import UIKit

class CreateAccountVC: UIViewController{
    
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
            
            
//            let person = Person(username: username, password: password, currentHours: 0, targetHours: 0)
            
            var person = Person(user: username, pass: password, currHours: 0, tarHours: 0)!
            
            var people = [] as? [Person]
            if let data = defaults.data(forKey: "arr") {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Person
                    people = try decoder.decode([Person].self, from: data)

//                    print(people.map { $0.username })
                    print(people?.count)
                } catch {
                    print("Unable to Decode People (\(error))")
                }
            }
//            var people = defaults.object(forKey: "arr") as? [Person] ?? [] as? [Person]
            do {
                
                //If has other Instances of person delete all other instances of this person
            
                people?.append(person)
                
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Person
                var data = try encoder.encode(people)
                
                        
                // Write/Set Data
                defaults.set(data, forKey: "arr")
                var peopleIterator = people?.makeIterator()
                while let p = peopleIterator?.next(){
                    print("\(p.username): \(p.password)")
                }
                print("---")

            } catch {
                print("Unable to Encode Array of People (\(error))")
            }
            
            
//            if let data = defaults.data(forKey: "arr") {
//                do {
//                    // Create JSON Decoder
//                    let decoder = JSONDecoder()
//
//                    // Decode Person
//                    let people = try decoder.decode([Person].self, from: data)
//
//                    print(people.map { $0.username })
//                    print(people.count)
//                } catch {
//                    print("Unable to Decode People (\(error))")
//                }
//            }
        }
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
