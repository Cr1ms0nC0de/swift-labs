//
//  Square.swift
//  Squares
//
//  Created by Wilkins, Nolan W on 11/17/22.
//

import UIKit

class Square: UIView{
    var location = CGPoint(x: 0, y: 0)
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addGestureRecognizer(UIPanGestureRecognizer(target: Square(), action: #selector(moveSquare(_:))))
        self.backgroundColor = UIColor(red: CGFloat.random(in: CGFloat(0.0)...CGFloat(1.0)), green: CGFloat.random(in: CGFloat(0.0)...CGFloat(1.0)), blue: CGFloat.random(in: CGFloat(0.0)...CGFloat(1.0)), alpha: 1)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func moveSquare(_ recognizer: UIPanGestureRecognizer) -> CGPoint{
        let translation = recognizer.translation(in: recognizer.view?.superview)
        self.center = translation
        return self.center
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        superview?.bringSubviewToFront(self)
    }
}
