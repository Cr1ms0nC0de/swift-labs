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
    var money: Int = 0
    var generators: [Int] = [0,0,0,0]
    var generatorCosts: [Int] = [2,100,10000,1000000]
    var generateAmount: [Int] = [0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyLabel.text = "\(money)$"
        for i in 0...3{
            generatorsLabel[i].text = "\(generators[i])"
            generatorCostsLabel[i].text = "\(generatorCosts[i])$"
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
        moneyLabel.text = "\(money)$"
    }
    @objc func updateStuff(){
        money += generateAmount[0]
        moneyLabel.text = "\(money)$"
        for i in 1...generators.count-1{
            generators[i-1] += generateAmount[i]
            generateAmount[i-1] += generateAmount[i]
            generatorsLabel[i].text = "\(generators[i])"
            generatorsLabel[i-1].text = "\(generators[i-1])"
        }
        if(generators[0] > 0){
            addMoneyButton.titleLabel?.text = "Gain \(generators[0])$"
        }
        else{
            addMoneyButton.titleLabel?.text = "Gain 1$"
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
            generatorCostsLabel[sender.tag].text = "\(generatorCosts[sender.tag])$"
        }
    }
}
