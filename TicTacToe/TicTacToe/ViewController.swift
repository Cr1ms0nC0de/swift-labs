//
//  ViewController.swift
//  TicTacToe
//
//  Created by Wilkins, Nolan W on 9/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    
    var inGame : Bool = true
    var xTurn : Bool = true
    
    var dict = [0: "", 1: "", 2: "", 3: "", 4: "", 5: "", 6: "", 7: "", 8: ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true;
        // Do any additional setup after loading the view.
        
        for i in 0...8{
            buttons[i].tag = i
        }
        for i in buttons{
            i.addTarget(self, action: #selector(playerPlace(_:)), for: .touchUpInside)
        }
        turnLabel.text = "It's X's turn"
        winnerLabel.text = ""
    }
    
    @objc func playerPlace(_ sender: UIButton!){
        if inGame{
            if dict[sender.tag] == ""{
                var str : String
                if xTurn{
                    str = "X"
                }
                else{
                    str = "O"
                }
                
                
                buttons[sender.tag].setTitle(str, for: .normal)
                dict[sender.tag] = str
                
                if checkForVictory() != ""{
                    winnerLabel.text = "\(str) wins"
                    inGame = false
                    restartButton.isHidden = false
                }
                else if checkForTie(){
                    winnerLabel.text = "Tie, Nobody wins"
                    inGame = false
                    restartButton.isHidden = false
                }
                
                if xTurn && inGame{
                    xTurn = false
                    turnLabel.text = "It's O's turn"
                }
                else if inGame{
                    xTurn = true
                    turnLabel.text = "It's X's turn"
                }
                else{
                    turnLabel.text = ""
                }
            }
        }
    }
    
    func checkForVictory() -> String{
        var player : String = ""
        if xTurn{
            player = "X"
        }
        else{
            player = "O"
        }
        
        if loopForVictory(player: player, from: 0, to: 2, by: 1){
            return player
        }
        if loopForVictory(player: player, from: 3, to: 5, by: 1){
            return player
        }
        if loopForVictory(player: player, from: 6, to: 8, by: 1){
            return player
        }
        if loopForVictory(player: player, from: 0, to: 8, by: 3){
            return player
        }
        if loopForVictory(player: player, from: 1, to: 8, by: 3){
            return player
        }
        if loopForVictory(player: player, from: 2, to: 8, by: 3){
            return player
        }
        if loopForVictory(player: player, from: 0, to: 8, by: 4){
            return player
        }
        if loopForVictory(player: player, from: 2, to: 6, by: 2){
            return player
        }
        
        return ""
    }
    
    func loopForVictory(player: String, from: Int, to: Int, by: Int) -> Bool{
        var win : Bool = true
        for i in stride(from: from, to: to+1, by: by){
            if dict[i] != player{
                win = false
                break;
            }
        }
        return win
    }
    func checkForTie() -> Bool{
        var tie : Bool = true
        for i in dict{
            if i.value == ""{
                tie = false;
                break;
            }
        }
        return tie
    }
    
    @IBAction func restartButtonBressed(_ sender: Any) {
        dict = [0: "", 1: "", 2: "", 3: "", 4: "", 5: "", 6: "", 7: "", 8: ""]
        for i in buttons{
            i.setTitle("", for: .normal)
        }
        xTurn = true
        turnLabel.text = "It's X's turn"
        winnerLabel.text = ""
        restartButton.isHidden = true
        inGame = true
    }
}
