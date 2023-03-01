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
    
    var categorySelected : String = Trivia.triviaQuestions.first!.key
    var questionNumberSelected : Int = 1
    var triviaQuestions = Trivia.triviaQuestions
    var questions: [Trivia] = []
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool){
        print("Category Selected: \(categorySelected)")
        print("Question Number Selected: \(questionNumberSelected)")
        for i in answerButtons{
            i.addTarget(self, action: #selector(answerSelected(_:)), for: .touchUpInside)
        }
        questions = triviaQuestions[categorySelected]!
        questions.shuffle()
        setupQuestion()
    }
    
    @IBAction func answerSelected(_ sender: UIButton){
        if sender.titleLabel?.text == questions[currentQuestionIndex].correct_answer{
            print("correct")
            score += 1
        }
        else{
            print("wrong")
        }
        print("Current Score: \(score)")
        if(currentQuestionIndex < questionNumberSelected){
            currentQuestionIndex += 1
            setupQuestion()
        }
        else{
            print("Final Score: \(score) out of \(questionNumberSelected)")
        }
    }
    func setupQuestion(){
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        let answers = currentQuestion.getScrambledAnswers()
        var index = 0
        for i in answerButtons{
            i.setTitle(answers[index] , for: .normal)
            index += 1
        }
    }
}
