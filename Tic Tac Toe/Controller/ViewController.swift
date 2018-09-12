//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Emil Villefrance on 22/01/16.
//  Copyright © 2016 Fyxe IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = TicTacToe(numberOfFields: 9)

    @IBOutlet var fieldButtons: [UIButton]!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
    
        game.resetGame()
        
        gameOverLabel.isHidden = true
        
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        
        playAgainButton.isHidden = true
        
        playAgainButton.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        
        for button in fieldButtons {
            button.setImage(nil, for: UIControlState())
            button.isEnabled = true
        }
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if let fieldNumber = fieldButtons.index(of: sender) {
            
            game.chooseField(at: fieldNumber)
            updateViewFromModel()
            
        }
    
    }
    
    func updateViewFromModel() {
        
        if let winner = game.winner {
            if winner == .nought {
                gameOverLabel.text = "Noughts have won!"
            } else if winner == .cross {
                gameOverLabel.text = "Crosses have won!"
            } else {
                gameOverLabel.text = "It's a draw!"
            }
            endGame()
        }
        
        for index in fieldButtons.indices {
            let button = fieldButtons[index]
            let field = game.board[index]
            
            if field.token == .nought {
                button.setImage(UIImage(named: "nought.png"), for: UIControlState())
            } else if field.token == .cross {
                button.setImage(UIImage(named: "cross.png"), for: UIControlState())
            }
        }
    }
    
    func endGame() {
        // disable fieldButtons
        for field in fieldButtons {
            field.isEnabled = false
        }
        
        gameOverLabel.isHidden = false
        playAgainButton.isHidden = false
    
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
    
            self.gameOverLabel.center = CGPoint(x: self.gameOverLabel.center.x + 500, y: self.gameOverLabel.center.y)
    
            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
    
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        gameOverLabel.isHidden = true
        
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        
        playAgainButton.isHidden = true
        
        playAgainButton.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
    
    }
}

