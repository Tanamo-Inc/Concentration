//
//  Card.swift
//  concentration
//
//  Created by mac on 12/30/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var identifier :Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return  identifierFactory
    }
    
    
    init(){
//        self.identifier = 0
        
        // Self means this struct's identifier (so the global var inside the struct)
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
    
    
}
