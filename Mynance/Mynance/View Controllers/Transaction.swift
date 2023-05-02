//
//  Transaction.swift
//  Mynance
//
//  Created by Wilkins, Nolan W on 5/2/23.
//

import Foundation

struct Transaction : Codable{
    let amount : Int
    let date : Date
    let description : String
    let category : Category
    
    init(amount: Int, date: Date, description: String, category: Category) {
        self.amount = amount
        self.date = date
        self.description = description
        self.category = category
    }
    
    enum Category : CaseIterable, Codable{
        case Income, Groceries, Utilities, Other
        
        var description: String{
            get{
                String(describing: self)
            }
        }
        var imageName: String{
            switch self{
                case .Groceries: return "cart.fill"
                case .Income: return "dollarsign.circle.fill"
                case .Utilities: return "bolt.fill"
                case .Other: return ""
            }
        }
    }
}
