//
//  Card.swift
//  concentration
//
//  Created by mac on 12/30/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import Foundation

//Making struct Hashable
struct Card : Hashable

{
    
    
// Hashable inherits from Equatable, so when you declare Hashable //conformance, Equatable methods are synthetised for you.
    
    var hashValue :Int{return identifier}
//
    static func == (lhs:Card,rhs:Card) ->Bool {

        return lhs.identifier == rhs.identifier
    }
    
    
    var isFaceUp = false
    var isMatched = false
    private var identifier :Int
    
   private static var identifierFactory = 0
    
    
   private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return  identifierFactory
    }
    
    
    init(){
//        self.identifier = 0
        
        // Self means this struct's identifier (so the global var inside the struct)
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
    
    
}
