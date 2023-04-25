//
//  Meal.swift
//  Meal Tracker
//
//  Created by Wilkins, Nolan W on 4/25/23.
//

import Foundation

struct Meal{
    var name: String
    var food: [Food]
    
    init(name: String, food: [Food]) {
        self.name = name
        self.food = food
    }
}
