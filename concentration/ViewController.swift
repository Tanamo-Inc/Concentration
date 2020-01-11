//
//  ViewController.swift
//  concentration
//
//  Created by mac on 12/28/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Cannot use property observer with lazy var.
  lazy var game = Concentration(numberOfPairOfCards: (cardButton.count + 1) /  2)
    
    
    // No need to declare variable type in swift.
    var flipCount = 0 {
        
    didSet {
       flipCountLabel.text = "Flip Counts : \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButton: [UIButton]!
    
    
    //  Ignored external name using underbar
    @IBAction func touchCard(_ sender: UIButton) {
        
    flipCount += 1
        
        
        // use let for constant.
        if   let cardNumber = cardButton.firstIndex(of: sender){
//        print("Card number is : \(cardNumber ?? 1010)")
//            flipCard(withEmoji: emojiChoice[cardNumber],on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }
        else{
            
        }
            
            
//    print("You clicked me")
//        flipCard(withEmoji: "🧛", on: sender)
    }
    
//    @IBAction func touchCard2(_ sender: UIButton) {
//
//        flipCount += 1
//
////        flipCountLabel.text = "Flip Counts : \(flipCount)"
//
//        flipCard(withEmoji: "👑", on: sender)
//    }
//
    
    
    func updateViewFromModel(){
        
        for index in cardButton.indices{
            
        let button = cardButton[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for:UIControl.State.normal)
                
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
                
            else {
            button.setTitle("", for: UIControl.State.normal)
                   
                button.backgroundColor =  card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
                
                
            } 
        }
        
    }
    
    var emojiChoice  = ["👑","🧛","🎅","🎲","🚒","💊","🦋","🍎", "🍊", "🍑", "🌺"]
    
//    var emoji = Dictionary<Int,String>()
    
    var emoji = [Int:String]()
    
    
    func emoji(for card:Card) -> String{
        

        if emoji[card.identifier]  == nil,emojiChoice.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            
            emoji[card.identifier] = emojiChoice.remove(at:randomIndex)
            
        }
        
        return  emoji[card.identifier] ?? "?"
        
        
//        if let chosenEmoji = emoji[card.identifier] {
//            return chosenEmoji
//        } else {
//            return "?"
//        }
        
        
        
//        let choseCard = emoji[card.identifier]
       
    }
    
    
    
    


    
}

