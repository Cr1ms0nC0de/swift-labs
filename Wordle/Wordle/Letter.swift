//
//  Letter.swift
//  Wordle
//
//  Created by Wilkins, Nolan W on 4/5/23.
//

import UIKit

class Letter: UILabel{
    var character: String = ""
    
    func flip(){
        UIView.transition(with: self, duration: 1.0,options: [.transitionFlipFromTop], animations: {
            print("flip")
        }, completion:{_ in
            print("flipped")
        })
    }
}
