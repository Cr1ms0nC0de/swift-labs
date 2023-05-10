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
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateStuff), userInfo: nil, repeats: true)
        for i in generatorBuyButtons{
            i.addTarget(self, action: #selector(buyGenerator), for: .touchUpInside)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func moneyButtonClicked(_ sender: Any) {
        money+=1
        moneyLabel.text = "\(money)$"
    }
    @objc func updateStuff(){
            money += generateAmount[0]
            moneyLabel.text = "\(money)$"
        for i in 1...3{
            generators[i] += generateAmount[i]
            generatorsLabel[i].text = "\(generators[i])"
        }
    }
    @IBAction func buyGenerator(_ sender: UIButton) {
        if generatorCosts[sender.tag] <= money{
            generators[sender.tag]+=1
            generatorsLabel[sender.tag].text = "\(generators[sender.tag])"
            money -= generatorCosts[sender.tag]
            moneyLabel.text = "\(money)$"
            generatorCosts[sender.tag] = Int(Double(generatorCosts[sender.tag]) * 1.5)
            generatorCostsLabel[sender.tag].text = "\(generatorCosts[sender.tag])$"
            generateAmount[sender.tag] += 1
        }
    }
}

