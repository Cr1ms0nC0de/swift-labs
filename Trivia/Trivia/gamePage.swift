//
//  gamePage.swift
//  Trivia
//
//  Created by Wilkins, Nolan W on 2/27/23.
//

import UIKit

class gamePage: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    var categorySelected : String = ""
    var questionNumberSelected : Int = 0
    var triviaQuestions = Trivia.triviaQuestions
    var questions: [Trivia] = []
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in answerButtons{
            i.addTarget(self, action: #selector(answerSelected(_:)), for: .allTouchEvents)
        }
        var questions = triviaQuestions[categorySelected]
        questions?.shuffle()
        var currentQuestion = questions![currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        var answers = currentQuestion.getScrambledAnswers()
        var index = 0
        for i in answerButtons{
            i.titleLabel?.text = answers[index]
            index += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
        print("Category Selected: \(categorySelected)")
        print("Question Number Selected: \(questionNumberSelected)")
    }
    
    @IBAction func answerSelected(_ sender: UIButton){
        
    }
}
