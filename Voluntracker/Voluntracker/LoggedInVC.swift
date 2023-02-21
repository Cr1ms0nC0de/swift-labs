//
//  LoggedInVC.swift
//  Voluntracker
//
//  Created by Wilkins, Nolan W on 2/13/23.
//

import UIKit

var targetHours: Int = 0
var currentHours: Int = 0

let defaults = UserDefaults.standard

class LoggedInVC: UIViewController {
    @IBOutlet weak var currentHoursLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var helpMessage: UILabel!
    @IBOutlet weak var congratulationsMessage: UILabel!
    
    @IBOutlet weak var addHourButton: UIButton!
    @IBOutlet weak var removeHourButton: UIButton!
    
    @IBOutlet weak var hoursEntry: UITextField!
    
    // Setting user defaults contents to a local variable
    var currentHoursStorage: [String: Double] = defaults.object(forKey: "Current Hours") as? [String:Double] ?? [:]
    var goalHoursStorage: [String: Double] = defaults.object(forKey: "Goal Hours") as? [String:Double] ?? [:]
    
    var username : String = ""
    
    var userExists : Bool = false
    
    var people = [] as? [Person]

    var currentUser: Person = Person(user: "temp", pass: "temp", currHours: 0, tarHours: 0)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializes the values to original
        currentHours = 0
        targetHours = 0
        
        currentHoursLabel.text = "\(currentHours) out of \(targetHours)"
        
        
        if let data = defaults.data(forKey: "arr") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Person
                people = try decoder.decode([Person].self, from: data)
                print(people?.count)
                //set username to the username provided by the segue
                //set currentUser to the currentUser through defaults.data(forKey: "arr")
            } 
            catch {
                print("Unable to Decode People (\(error))")
            }
        }
        // Sets values of goal hours to stored value if a user is there
        var peopleIterator = people?.makeIterator()
        while let p = peopleIterator?.next(){
            if username == p.username{
                targetHours = p.targetHours
                currentHours = p.currentHours
                userExists = true
            }
            else{
                userExists = false
            }
        }
        
        // Initializes all the values to their initial values
        welcomeLabel.text! = "Hello \(username)"
        
        progressLabel.text! = "\(username)'s progress"
        progressLabel.isHidden = true
        
        currentHoursLabel.text = ""
        currentHoursLabel.isHidden = true
        
        welcomeLabel.isHidden = false
        helpMessage.isHidden = false
        hoursEntry.isHidden = false
        
        addHourButton.isHidden = true
        removeHourButton.isHidden = true
        congratulationsMessage.isHidden = true
        
        // Loads user if user exists
        if userExists
        {
            loadingUser()
        }
    }
    @IBAction func incrementHour(_ sender: Any) {
        if currentHours + 1 == targetHours
        {
            currentHours += 1
            
            storeCurrentHours()
            
            currentHoursLabel.text = "\(currentHours) out of \(targetHours)"
            
            congratulationsMessage.isHidden = false
        }
        else if currentHours < targetHours
        {
            congratulationsMessage.isHidden = true
            currentHours += 1
            
            storeCurrentHours()
            
            currentHoursLabel.text = "\(currentHours) out of \(targetHours)"
        }
        
    }
    
    @IBAction func removeHour(_ sender: Any) {
        if currentHours - 1 < 0
        {
            return
        }
        else
        {
            congratulationsMessage.isHidden = true
            
            currentHours -= 1
            
            currentHoursLabel.text = "\(currentHours) out of \(targetHours)"
        }
        
    }
    @IBAction func hoursEntered(_ sender: Any) {
        targetHours = Int(hoursEntry.text!) ?? 0
        
        storeGoalHours()
        
        welcomeLabel.isHidden = true
        helpMessage.isHidden = true
        hoursEntry.isHidden = true
        
        currentHoursLabel.isHidden = false
        progressLabel.isHidden = false
        addHourButton.isHidden = false
        removeHourButton.isHidden = false
        
        currentHoursLabel.text = "\(currentHours) out of \(targetHours)"
    }
    func storeGoalHours()
    {
//        var users = defaults.object(forKey: "Goal Hours") as? [String:Double] ?? [:]
            
        
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            // Encode Person
            var data = try encoder.encode(people)
            
                    
            // Write/Set Data

            //set value of players targetHours to targetHours
            //Delete previous instance of player
            //readd player to array
            defaults.set(data, forKey: "arr")
            var peopleIterator = people?.makeIterator()
            while let p = peopleIterator?.next(){
                print("\(p.username): \(p.password)")
            }
            print("---")

        } catch {
            print("Unable to Encode Array of People (\(error))")
        }
        
        //defaults.set(users, forKey: "Goal Hours")
        
    }
    func storeCurrentHours()
    {
        var users = defaults.object(forKey: "Current Hours") as? [String:Double] ?? [:]
        //users[username] = currentHours
        
        defaults.set(users, forKey: "Current Hours")
        
    }
    func loadingUser()
    {
        // Initialization
        welcomeLabel.isHidden = true
        helpMessage.isHidden = true
        hoursEntry.isHidden = true
        
        currentHoursLabel.isHidden = false
        progressLabel.isHidden = false
        addHourButton.isHidden = false
        removeHourButton.isHidden = false
        
        currentHoursLabel.text = "\(currentHours) out of \(targetHours)"
    }
}
