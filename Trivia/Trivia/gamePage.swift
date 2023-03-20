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
    @IBOutlet weak var progressBar: UIProgressView!
    
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
        progressBar.progress = 0
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
        if(currentQuestionIndex < questionNumberSelected - 1){
            currentQuestionIndex += 1
            setupQuestion()
        }
        else{
            print("Final Score: \(score) out of \(questionNumberSelected)")
            progressBar.progress = 1
            performSegue(withIdentifier: "end", sender: nil)
            self.currentQuestionIndex = 0
            self.score = 0
            //setupAlert()
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
        progressBar.progress = (Float(currentQuestionIndex))/Float(questionNumberSelected)
    }
    func setupAlert(){
        performSegue(withIdentifier: "end", sender: nil)
        let alert = UIAlertController(title: "Results", message: "Final Score: \(score) out of \(questionNumberSelected)", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Start Over", style: .default) { (action) in
            self.tabBarController?.selectedIndex = 0
            self.currentQuestionIndex = 0
            self.score = 0
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? endPage
        destinationVC?.questionNumberSelected = questionNumberSelected
        destinationVC?.score = score
    }
}
