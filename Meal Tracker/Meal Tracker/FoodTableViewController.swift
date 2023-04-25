//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Wilkins, Nolan W on 4/25/23.
//

import UIKit

class FoodTableViewController: UITableViewController {

    var food = Food(name: "Sausage", description: "Some Meat")
    var food2 = Food(name: "Steak", description: "Good amount of meat")
    var food3 = Food(name: "Cow", description: "Too much meat")
    var meals: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        meals = [Meal(name: "Meat", food: [food, food2, food3]), Meal(name: "Meat2", food: [food, food2, food3]), Meal(name: "Meat3", food: [food, food2, food3])]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meals[indexPath.section].food[indexPath.row]
        
        content.text = meal.name
        context.secondaryText = food.name
        return cell
    }
}
