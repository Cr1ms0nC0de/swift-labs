//
//  ViewController.swift
//  Mynance
//
//  Created by Wilkins, Nolan W on 4/27/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    var transactions : [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.dataSource = self
        self.table.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
            if let data = UserDefaults.standard.data(forKey: "trans") {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                    transactions = try decoder.decode([Transaction].self, from: data)
                }
                catch {
                    print("Unable to Decode Note (\(error))")
                }
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = UserDefaults.standard.data(forKey: "trans") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                transactions = try decoder.decode([Transaction].self, from: data)
                return transactions.count
                
            }
            catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trans", for: indexPath)
        
        if let data = UserDefaults.standard.data(forKey: "trans") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                transactions = try decoder.decode([Transaction].self, from: data)
            }
            catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        var content = cell.defaultContentConfiguration()
        let desc = transactions[indexPath.row].description
        let category = transactions[indexPath.row].category
        let amount = transactions[indexPath.row].amount
        let date = transactions[indexPath.row].date
        content.text = desc
        content.secondaryText = "\(amount)"
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
       
    }
}
