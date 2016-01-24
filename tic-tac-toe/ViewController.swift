//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Maria on 1/22/16.
//  Copyright © 2016 Maria Notohusodo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var winningCombinations = [[11, 21, 31], [12, 22, 32], [13, 23, 33], [11, 12, 13], [21, 22, 23], [31, 32, 33], [11, 22, 33], [31, 22, 13]]
    var gameState: [Int: Int] = [11: 0, 21: 0, 31: 0, 12: 0, 22: 0, 32: 0, 13: 0, 23: 0, 33: 0]
    var gameActive = true
    

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 && gameActive == true {
            gameState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "cross"), forState: .Normal)
                
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "nought"), forState: .Normal)
                
                activePlayer = 1
            }
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        message.text = "Cross has won"
                    } else {
                        message.text = "Nought has won"
                    }
                    endGame()
                    
                   
                }
            }
            if gameActive == true {
                gameActive = false
                for value in gameState.values {
                    if value == 0 {
                       gameActive = true
                    }
                }
                if gameActive == false {
                    message.text = "It's a tie"
                    endGame()
                }
            }

        }
        
        
    }

    func endGame(){
        message.hidden = false
        UIView.animateWithDuration(0.5) { () -> Void in
            self.message.center = CGPointMake(self.message.center.x + 500 , self.message.center.y)
        }
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        message.hidden = true
     
        message.center = CGPointMake(message.center.x - 500, message.center.y)
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

