//
//  Person.swift
//  Voluntracker
//
//  Created by Wilkins, Nolan W on 2/9/23.
//

import UIKit
    struct Person: Codable{
        let username: String
        let password: String
        var currentHours: Int
        let targetHours: Int
        
        init?(user: String, pass: String, currHours: Int, tarHours: Int){
            username = user
            password = pass
            currentHours = currHours
            targetHours = tarHours
        }
    }
