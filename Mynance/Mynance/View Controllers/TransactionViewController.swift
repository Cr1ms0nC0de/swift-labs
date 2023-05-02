//
//  TransactionViewController.swift
//  Mynance
//
//  Created by Wilkins, Nolan W on 4/27/23.
//

import UIKit

let transactionTypes = ["Income", "Utilities", "Groceries", "Other Purchase"]
let defaults = UserDefaults.standard

class TransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var transactionPicker: UIPickerView!
    @IBOutlet var transactionAmount: UITextField!
    @IBOutlet var transactionDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transactionPicker.delegate = self
        self.transactionPicker.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIBarButtonItem
        if button.title == "Save"{
            var transaction = defaults.object(forKey: "Users") as? [String:String] ?? [:]
            
            transaction[username.text!] = password.text!
            
            defaults.set(transaction, forKey: "Users")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactionTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return transactionTypes[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
