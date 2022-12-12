//
//  ViewController.swift
//  tip-calculator
//
//  Created by Wilkins, Nolan W on 11/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountInput: UITextField!
    @IBOutlet weak var totalTip: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var otherSelection: UITextField!
    
    var tipTotal : Double = 0
    var billAmount : Double = 0
    var tipPercent : Double = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otherSelection.isHidden = true
        otherSelection.addTarget(self, action: #selector(ViewController.tipPercentChanged(_:)), for: .editingChanged)
        billAmountInput.addTarget(self, action: #selector(ViewController.billChanged(_:)), for: .editingChanged)
    }

    @IBAction func otherSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 3 {
            otherSelection.isHidden = false
        }
        else if sender.selectedSegmentIndex == 0{
            otherSelection.isHidden = true
            tipPercent = 15
        }
        else if sender.selectedSegmentIndex == 1{
            otherSelection.isHidden = true
            tipPercent = 18
        }
        else if sender.selectedSegmentIndex == 2{
            otherSelection.isHidden = true
            tipPercent = 20
        }
        calculateBillAmount()
    }
    
    @objc func tipPercentChanged(_ textField: UITextField) {
        tipPercent = Double(otherSelection.text!) ?? 0.0
        calculateBillAmount()
    }
    @objc func billChanged(_ textField: UITextField) {
        billAmount = Double(billAmountInput.text!) ?? 0.0
        calculateBillAmount()
     }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        otherSelection.isHidden = true
        tipTotal = 0
        billAmount = 0
        tipPercent = 15
        
        billAmountInput.text = ""
        otherSelection.text = ""
        totalBill.text = "$0.00"
        totalTip.text = "$0.00"
        
        tipSelection.selectedSegmentIndex = 0
    }
    func calculateBillAmount(){
        tipTotal = billAmount * (tipPercent/100.0)
        totalTip.text = "$\(String(format: "%.2f", tipTotal))"
        totalBill.text = "$\(String(format: "%.2f", billAmount + tipTotal))"
    }
}
