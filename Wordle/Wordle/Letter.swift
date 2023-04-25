//
//  Letter.swift
//  Wordle
//
//  Created by Wilkins, Nolan W on 4/5/23.
//

import UIKit

class Letter: UILabel{
    
    func flip(){
        UIView.transition(with: self, duration: 0.5,options: [.transitionFlipFromTop], animations: {
            
        }, completion:{_ in
        })
    }
}
