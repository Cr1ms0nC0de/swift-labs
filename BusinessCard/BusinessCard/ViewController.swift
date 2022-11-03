//
//  ViewController.swift
//  BusinessCard
//
//  Created by Wilkins, Nolan W on 10/20/22.
//

import UIKit

class ViewController: UIViewController {

    var photo = UIImageView()
    var name = UILabel()
    var job = UILabel()
    var infoButton = UIButton()
    var phone = UILabel()
    var email = UILabel()
    var screenWidth = 0
    var screenHeight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        setupPhoto()
        setupName()
        setupJob()
        setupInfoButton()
        setupPhone()
        setupEmail()
        view.addSubview(photo)
        view.addSubview(name)
        view.addSubview(job)
        view.addSubview(infoButton)
        view.addSubview(phone)
        view.addSubview(email)
        self.view = view
    }
    func setupScreen(){
        view.backgroundColor = UIColor.cyan
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
    }
    func setupPhoto(){
        photo.image = UIImage(named: "PhotoOfMe.jpeg")
        photo.frame = CGRect(x: screenWidth/4, y: screenHeight/4, width: screenWidth/2, height: screenWidth/2)
        photo.layer.cornerRadius = photo.frame.width / 2
        photo.layer.borderWidth = 5
        photo.layer.borderColor = UIColor.white.cgColor
        photo.layer.masksToBounds = true
    }
    
    func setupName(){
        name.text = "Nolan Wilkins"
        name.textColor = UIColor.white
        name.frame = CGRect(x: screenWidth/4, y: screenHeight * 45/100, width: screenWidth/2, height: screenHeight/10)
        name.textAlignment = .center
        name.font = UIFont(name: "Arial", size: 50)
        name.adjustsFontSizeToFitWidth = true
    }
    func setupJob(){
        job.text = "Student at LSHS"
        job.textColor = UIColor.white
        job.frame = CGRect(x: screenWidth/3, y: screenHeight * 48/100, width: screenWidth/3, height: screenHeight/10)
        job.textAlignment = .center
        job.font = UIFont(name: "Arial", size: 50)
        job.adjustsFontSizeToFitWidth = true
    }
    func setupInfoButton(){
        infoButton.frame = CGRect(x: screenWidth/3, y: screenHeight * 51/100, width: screenWidth/3, height: screenHeight/10)
        infoButton.setTitle("Tap to show contact info.", for: .normal)
        infoButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        infoButton.setTitleColor(.blue, for: .normal)
        infoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        infoButton.titleLabel?.font = UIFont(name: "Arial", size: 50)
        infoButton.addTarget(self, action: #selector(infoButtonPressed(_:)), for: .touchUpInside)
    }
    func setupPhone(){
        phone.isHidden = true
        phone.text = "Phone: 1-972-978-2030"
        phone.textColor = UIColor.blue
        phone.frame = CGRect(x: 0, y: screenHeight * 60/100, width: screenWidth, height: screenHeight/20)
        phone.textAlignment = .center
        phone.font = UIFont(name: "Arial", size: 20)
        phone.backgroundColor = UIColor.white
        phone.layer.cornerRadius = phone.frame.width / 20
        phone.layer.masksToBounds = true
    }
    func setupEmail(){
        email.isHidden = true
        email.text = "Email: nwilki01@gmail.com"
        email.textColor = UIColor.blue
        email.frame = CGRect(x: 0, y: screenHeight * 66/100, width: screenWidth, height: screenHeight/20)
        email.textAlignment = .center
        email.font = UIFont(name: "Arial", size: 20)
        email.backgroundColor = UIColor.white
        email.layer.cornerRadius = email.frame.width / 20
        email.layer.masksToBounds = true
    }
    @objc func infoButtonPressed(_ sender: UIButton!){
        if infoButton.titleLabel?.text == "Tap to show contact info."{
            infoButton.setTitle("Tap to hide contact info.", for: .normal)
            phone.isHidden = false
            email.isHidden = false
        }
        else{
            infoButton.setTitle("Tap to show contact info.", for: .normal)
            phone.isHidden = true
            email.isHidden = true
        }
    }
}

