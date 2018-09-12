//
//  Token.swift
//  Tic Tac Toe
//
//  Created by Emil Villefrance on 12/09/2018.
//  Copyright © 2018 Fyxe IT. All rights reserved.
//

import Foundation

struct Field {
    var token = Token.empty
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Field.getUniqueIdentifier()
    }
}

enum Token {
    case empty, nought, cross
}
