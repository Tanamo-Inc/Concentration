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
    
    var indexOfOneAndOnlyFacedCard: Int?
    
    func chooseCard(at index: Int){
    
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//            }
//        else {
//          cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFacedCard , matchIndex != index{
                // Check if Cards match
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched=true
                    
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedCard = nil
                
            }
            else{
                //  Either no cards or two cards are face up
                
                for flipDownIndice in cards.indices{
                    
                    cards[flipDownIndice].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
               indexOfOneAndOnlyFacedCard = index
                
            }
            
            
            
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
