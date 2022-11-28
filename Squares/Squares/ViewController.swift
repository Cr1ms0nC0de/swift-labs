//
//  ViewController.swift
//  Squares
//
//  Created by Wilkins, Nolan W on 11/17/22.
//

import UIKit

class ViewController: UIViewController {

    let squareCount = 10000
    var screenWidth: Int = 0
    var screenHeight: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        print("test")
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        for _ in 1...squareCount{
            view.addSubview(Square(frame: CGRect(origin: CGPoint(x: Int.random(in: 0...screenWidth), y: Int.random(in: 0...screenHeight)), size: CGSize(width: Int.random(in: 1...1000), height: Int.random(in: 1...1000)))))
        }
        self.view = view
    }
}

