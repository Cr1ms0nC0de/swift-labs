//
//  Letter.swift
//  Wordle
//
//  Created by Wilkins, Nolan W on 4/5/23.
//

import UIKit

class Letter: UILabel{
    var character: String = ""
    var correctPos: Bool = false
    var wrongPos: Bool = false
    
    func flip(){
        UIView.transition(with: self, duration: 1.0,options: [.transitionFlipFromTop], animations: {
            print("flip")
        }, completion:{_ in
            print("flipped")
        })
    }
    
    func updateBackgroundColor(){
        if correctPos{
            self.backgroundColor = UIColor.systemGreen
        }
        else if wrongPos{
            self.backgroundColor = UIColor.systemYellow
        }
        else{
            self.backgroundColor = UIColor.lightGray
        }
    }
}
