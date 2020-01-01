//
//  Concentration.swift
//  concentration
//
//  Created by mac on 12/30/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    
    func chooseCard(at index: Int){
    
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
            }
        else {
          cards[index].isFaceUp = true
        }
    }
    
    
    init(numberOfPairOfCards:Int){
        
        for  _ in 1...numberOfPairOfCards {
    
        let card = Card()
        cards += [card,card]
           
        }
        //TODO : Shuffle the Cards
        
    }
    
    
    
    
    
    
}
