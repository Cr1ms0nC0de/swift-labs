//
//  ViewController.swift
//  Mynance
//
//  Created by Wilkins, Nolan W on 4/27/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        
        var content = cell.defaultContentConfiguration()
        content.text = "Funny"
        content.secondaryText = "Test"
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
   
    }
}

