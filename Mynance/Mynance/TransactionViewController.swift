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
    var category: Transaction.Category = .Income
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transactionPicker.delegate = self
        self.transactionPicker.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIBarButtonItem
        if button.title == "Save"{
            
            if let data = UserDefaults.standard.data(forKey: "trans") {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                    var transactions = try decoder.decode([Transaction].self, from: data)
                    let trans: Transaction = Transaction(amount: Int(transactionAmount.text!) ?? 0, date: Date(), description: transactionDesc.text ?? "", category: category)
                    transactions.append(trans)
                    for i in transactions{
                        print(i.description)
                    }
                    print(transactions.count)
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(transactions) {
                        defaults.set(encoded, forKey: "trans")
                    }
                }
                catch {
                    print("Unable to Decode Note (\(error))")
                }
            }
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactionTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if transactionTypes[row].description == "Income"{
            category = .Income
        }
        else if transactionTypes[row].description == "Utilities"{
            category = .Utilities
        }
        else if transactionTypes[row].description == "Groceries"{
            category = .Groceries
        }
        else{
            category = .Other
        }
        return transactionTypes[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
