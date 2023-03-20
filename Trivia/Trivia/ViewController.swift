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
    var questionAmount : Int = 1
    var questionNumberSelected : Int = 1
    var categorySelected : String = Trivia.triviaQuestions.first!.key
    
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
              
        if pickerView == categoryPicker{
            print("category selected")
                  
            categorySelected = categoryData[row]
                  
            let secondTab = (self.tabBarController?.viewControllers![1] as! gamePage)
                secondTab.categorySelected = categorySelected
        }
        else{
            print("question number picked")
            questionNumberSelected = Int(questionCountData[row])!
                  
            let secondTab = (self.tabBarController?.viewControllers![1] as! gamePage)
            secondTab.questionNumberSelected = questionNumberSelected
        }
    }
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue){
        
    }
}

