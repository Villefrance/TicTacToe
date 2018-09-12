//
//  TicTacToe.swift
//  Tic Tac Toe
//
//  Created by Emil Villefrance on 12/09/2018.
//  Copyright © 2018 Fyxe IT. All rights reserved.
//

import Foundation

class TicTacToe {
    var board = [Field]()
    var activePlayer = Token.nought // 1 = noughts, 2 = crosses
    var winner: Token?
    
    let winningCombinations = [[0, 1, 2], [3, 4 ,5], [6, 7 ,8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true
    
    func chooseField(at index: Int) {
        board[index].token = activePlayer
        
        if activePlayer == .nought {
            activePlayer = .cross
        } else {
            activePlayer = .nought
        }
        
        if !checkWinningCombinations() {
            checkForDraw()
        }
    }
    
    func checkWinningCombinations() -> Bool {
        for combination in winningCombinations {
            if board[combination[0]].token != .empty && board[combination[0]].token == board[combination[1]].token && board[combination[1]].token == board[combination[2]].token {
                gameActive = false
                
                if board[combination[0]].token == .nought {
                    winner = .nought
                } else {
                    winner = .cross
                }
                return true
            }
        }
        return false
    }
    
    func checkForDraw() {
        if gameActive {
            gameActive = false
            for field in board {
                if field.token == .empty {
                    gameActive = true
                }
            }
        }
        if !gameActive {
            winner = .empty
        }
    }
    
    func resetGame() {
        activePlayer = .nought
        winner = nil
        for index in board.indices {
            board[index].token = .empty
        }
        gameActive = true
    }
    
    init(numberOfFields: Int) {
        for _ in 0..<numberOfFields {
            let field = Field()
            board.append(field)
        }
    }
}
