//
//  Concentration.swift
//  concentration
//
//  Created by mac on 12/30/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import Foundation


//change from class to struct. Struct are value type and they are not stored in heap.

struct Concentration{
    
  private(set)  var cards = [Card]()
    
    
    //using computed property
  private  var indexOfOneAndOnlyFacedCard: Int?{
        
        get{
            
//            let faceUpCardIndices = cards.indices.filter{ cards[$0].isFaceUp}
            
            return cards.indices.filter{ cards[$0].isFaceUp}.oneAndOnly
            
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            var foundIndex : Int?
//
//            for index in cards.indices{
//                if(cards[index].isFaceUp){
//
//                    if(foundIndex == nil){
//                        foundIndex = index
//                    }
//                    else{
//
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
    
        set{
            for index in cards.indices{
            cards[index].isFaceUp = (index == newValue)
        }
        
    }
    
    }
    
    
    mutating func chooseCard(at index: Int){
    
        assert(cards.indices.contains(index),"Concentration.choosecard(at : \(index)) : index not found")
        
        
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//            }
//        else {
//          cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFacedCard , matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched=true
                }
                
                cards[index].isFaceUp = true
            
                
            } 
            else{
                //  Either no cards or two cards are face up
        
               indexOfOneAndOnlyFacedCard = index
                
            }
            
            
            
        }
        
        
    }
    
    
    init(numberOfPairOfCards:Int){

        assert(numberOfPairOfCards > 0,"Concentration.init(at : \(numberOfPairOfCards )) : you must have at least one pair of cards")
        
        for  _ in 1...numberOfPairOfCards {
    
        let card = Card()
        cards += [card,card]
           
        }
        //TODO : Shuffle the Cards
        
    }
    
}

extension Collection{
    
    var oneAndOnly : Element? {
    
    return count == 1 ? first : nil
        
    }
}
