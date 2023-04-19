//
//  ViewController.swift
//  ISpy
//
//  Created by Wilkins, Nolan W on 4/17/23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pufferfish: UIImageView!
    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pufferfish.frame.origin = CGPoint(x: Int.random(in: 0...(1200 - Int(pufferfish.frame.width))), y: Int.random(in: 0...(1200 - Int(pufferfish.frame.height))))
        print(pufferfish.frame.origin)
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        pufferfish.addGestureRecognizer(tapGR)
        pufferfish.isUserInteractionEnabled = true
        setupScrollView()
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        pufferfish.frame.origin = CGPoint(x: Int.random(in: 0...(1200 - Int(pufferfish.frame.width))), y: Int.random(in: 0...(1200 - Int(pufferfish.frame.height))))
        print(pufferfish.frame.origin)
    }
    
    func setupScrollView(){
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mainView
    }
}

