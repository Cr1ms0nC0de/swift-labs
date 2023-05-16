//
//  ViewController.swift
//  Incremental Game
//
//  Created by Wilkins, Nolan W on 5/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var addMoneyButton: UIButton!
    @IBOutlet var generatorsLabel: [UILabel]!
    @IBOutlet var generatorCostsLabel: [UILabel]!
    @IBOutlet var generatorBuyButtons: [UIButton]!
    @IBOutlet weak var switchNumberFormatButton: UIButton!
    var money: Int = 0
    var generators: [Int] = [0,0,0,0]
    var generatorCosts: [Int] = [2,100,10000,1000000]
    var generateAmount: [Int] = [0,0,0,0]
    let formatter = NumberFormatter()
    var scientific : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        moneyLabel.text = "\(money)$"
        addMoneyButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        switchNumberFormatButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        for i in 0...3{
            if scientific{
                if let scientificFormatted = formatter.string(for: generators[i]) {
                    generatorsLabel[i].text = "\(scientificFormatted)"
                }
                if let scientificFormatted = formatter.string(for: generatorCosts[i]) {
                    generatorCostsLabel[i].text = "\(scientificFormatted)$"
                }
            }
            else{
                generatorsLabel[i].text = "\(generators[i])"
                generatorCostsLabel[i].text = "\(generatorCosts[i])$"
            }
        }
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateStuff), userInfo: nil, repeats: true)
        for i in generatorBuyButtons{
            i.addTarget(self, action: #selector(buyGenerator), for: .touchUpInside)
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func moneyButtonClicked(_ sender: Any) {
        if(generators[0] == 0){
            money+=1
        }
        else{
            money+=generators[0]
        }
        if scientific{
            if let scientificFormatted = formatter.string(for: money) {
                moneyLabel.text = "\(scientificFormatted)$"
            }
        }
        else{
            moneyLabel.text = "\(money)$"
        }
    }
    @objc func updateStuff(){
        money += generateAmount[0]
        if scientific{
            if let scientificFormatted = formatter.string(for: money) {
                moneyLabel.text = "\(scientificFormatted)$"
            }
        }
        else{
            moneyLabel.text = "\(money)$"
        }
        for i in 1...generators.count-1{
            generators[i-1] += generateAmount[i]
            generateAmount[i-1] += generateAmount[i]
            if scientific{
                if let scientificFormatted = formatter.string(for: generators[i]) {
                    generatorsLabel[i].text = "\(scientificFormatted)"
                }
                if let scientificFormatted = formatter.string(for: generators[i-1]) {
                    generatorsLabel[i-1].text = "\(scientificFormatted)"
                }
            }
            else{
                generatorsLabel[i].text = "\(generators[i])"
                generatorsLabel[i-1].text = "\(generators[i-1])"
            }
        }
        if(generators[0] > 0){
            if scientific{
                if let scientificFormatted = formatter.string(for: generators[0]) {
                    addMoneyButton.setTitle("Gain \(scientificFormatted)$", for: .normal)
                }
            }
            else{
                addMoneyButton.setTitle("Gain \(generators[0])$", for: .normal)
            }
        }
        else{
            addMoneyButton.setTitle("Gain 1$", for: .normal)
        }
        //        for i in 0...3{
        //            if generators[i] >= 100{
        //                generatorBuyButtons[i].titleLabel?.text = "Buy \(generators[i] / 100)"
        //            }
        //            else{
        //                generatorBuyButtons[i].titleLabel?.text = "Buy 1"
        //            }
        //        }
    }
    @IBAction func buyGenerator(_ sender: UIButton) {
        if generatorCosts[sender.tag] <= money{
            //            if generators[sender.tag] >= 100{
            //                generators[sender.tag] += generators[sender.tag] / 100
            //                generateAmount[sender.tag] += generators[sender.tag] / 100
            //                generatorBuyButtons[sender.tag].titleLabel?.text = "Buy \(generators[sender.tag] / 100)"
            //            }
            //            else{
            //                generators[sender.tag] += 1
            //                generateAmount[sender.tag] += 1
            //                generatorBuyButtons[sender.tag].titleLabel?.text = "Buy 1"
            //            }
            generators[sender.tag] += 1
            generateAmount[sender.tag] += 1
            generatorsLabel[sender.tag].text = "\(generators[sender.tag])"
            money -= generatorCosts[sender.tag]
            moneyLabel.text = "\(money)$"
            generatorCosts[sender.tag] = Int(Double(generatorCosts[sender.tag]) * 1.5)
            if scientific{
                if let scientificFormatted = formatter.string(for: generatorCosts[sender.tag]) {
                    generatorCostsLabel[sender.tag].text = "\(scientificFormatted)$"
                }
            }
            else{
                generatorCostsLabel[sender.tag].text = "\(generatorCosts[sender.tag])$"
            }
        }
    }
    @IBAction func switchNumberFormat(_ sender: Any) {
        if scientific{
            scientific = false
            switchNumberFormatButton.setTitle("Normal", for: .normal)
        }
        else{
            scientific = true
            switchNumberFormatButton.setTitle("Scientific", for: .normal)
        }
        for i in 0...3{
            if scientific{
                if let scientificFormatted = formatter.string(for: generators[i]) {
                    generatorsLabel[i].text = "\(scientificFormatted)"
                }
                if let scientificFormatted = formatter.string(for: generatorCosts[i]) {
                    generatorCostsLabel[i].text = "\(scientificFormatted)$"
                }
            }
            else{
                generatorsLabel[i].text = "\(generators[i])"
                generatorCostsLabel[i].text = "\(generatorCosts[i])$"
            }
        }
        if scientific{
            if let scientificFormatted = formatter.string(for: money) {
                moneyLabel.text = "\(scientificFormatted)$"
            }
            if let scientificFormatted = formatter.string(for: generators[0]) {
                addMoneyButton.titleLabel?.text = "Gain \(scientificFormatted)$"
            }
        }
        else{
            moneyLabel.text = "\(money)$"
            addMoneyButton.titleLabel?.text = "Gain \(generators[0])$"
        }
    }
}
