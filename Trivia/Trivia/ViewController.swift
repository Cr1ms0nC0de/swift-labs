//
//  ViewController.swift
//  Trivia
//
//  Created by Wilkins, Nolan W on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var questionCountPicker: UIPickerView!
    
    var categoryData: [String] = [String]()
    var questionCountData: [String] = [String]()
    var questionAmount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        self.questionCountPicker.delegate = self
        self.questionCountPicker.dataSource = self
        
        for (type, question) in Trivia.triviaQuestions{
            categoryData.append(type)
            questionAmount = question.count
        }
        var nums : [String] = [String]()
        for i in 1...questionAmount{
            nums.append(String(i))
        }
        questionCountData = nums
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == categoryPicker{
            return categoryData.count
        }
        else{
            return questionCountData.count
        }
    }
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if pickerView == categoryPicker{
            return categoryData[row]
        }
        else{
            return questionCountData[row]
        }
    }
    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if pickerView == categoryPicker{
            print("Category")
        }
        else{
            print("Quesstion")
        }
    }
}

