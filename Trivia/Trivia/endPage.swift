//
//  endPage.swift
//  Trivia
//
//  Created by Wilkins, Nolan W on 3/9/23.
//

import UIKit

class endPage: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
    var questionNumberSelected = 0;
    var score = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Final Score: \(score) out of \(questionNumberSelected)"
        //setupAlert()
        // Do any additional setup after loading the view.
    }
    
    
//    func setupAlert(){
//        let alert = UIAlertController(title: "Results", message: "Final Score: \(score) out of \(questionNumberSelected)", preferredStyle: .alert)
//        let OKAction = UIAlertAction(title: "Start Over", style: .default) { (action) in
//            self.tabBarController?.selectedIndex = 0
//        }
//        alert.addAction(OKAction)
//        self.present(alert, animated: true, completion: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
