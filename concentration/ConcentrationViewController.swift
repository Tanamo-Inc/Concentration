//
//  ViewController.swift
//  concentration
//
//  Created by mac on 12/28/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    // Cannot use property observer with lazy var.
 private lazy var game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    
    
    // using computed property
    var numberOfPairOfCards :Int {
        
           return  (cardButton.count + 1) /  2
        
//        // use get for read only.
//        get{
//            return  (cardButton.count + 1) /  2
//        }
        
    }
    

    // No need to declare variable type in swift.
   private(set) var flipCount = 0 {
        
    didSet {
        
//       flipCountLabel.text = "Flip Counts : \(flipCount)"
        
          updateFlipCountLabel()
        
        }
    }
    
    
    
    private func updateFlipCountLabel(){
    
        //Using NSAttributedString . NS  is a cue that it is old atyle Objective-C Class.
        let attributes : [NSAttributedString.Key:Any] =
            [
                .strokeWidth: 5.0,
                .strokeColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
    
        let attributesString = NSAttributedString(string: "Flip Counts : \(flipCount)",attributes:attributes)
        
       flipCountLabel.attributedText = attributesString
    
    }

    
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        
        didSet{
            updateFlipCountLabel()
        }
    }
    
    

    
    @IBOutlet private var cardButton: [UIButton]!
    
    
    //  Ignored external name using underbar
    @IBAction private func touchCard(_ sender: UIButton) {
        
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
    
    
 private func updateViewFromModel(){
        
    if cardButton != nil {
    
        for index in cardButton.indices{
            
        let button = cardButton[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(myEmoji(for: card), for:UIControl.State.normal)
                
                button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
                
            else {
            button.setTitle("", for: UIControl.State.normal)
                   
                button.backgroundColor =  card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
                
                
            } 
        }
    }
        
    }
    
    
    var theme : String? {

    didSet{

    emojiChoice = theme ??  ""
        
    emoji = [:]

    updateViewFromModel()

    }

}
    
    //change from array to string below
    //   private var emojiChoice  = ["👑","🧛","🎅","🎲","🚒","💊","🦋","🍎", "🍊", "🍑", "🌺"]
    
  private var emojiChoice  = "👑🧛🎅🎲🚒💊🦋🍎🍊🍑🌺"
    
    
//    var emoji = Dictionary<Int,String>()
    
  private  var emoji = [Card:String]()
    
    
  private  func myEmoji(for card:Card) -> String{


        if emoji[card]  == nil,emojiChoice.count > 0{


            let randomString = emojiChoice.index(emojiChoice.startIndex, offsetBy: emojiChoice.count.arc4random)

            emoji[card] =  String(emojiChoice.remove(at:randomString))

        }

        return  emoji[card] ?? "?"

    }
    
    
    

}



extension Int {
    
    var arc4random : Int{
        
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            
               return  -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
            return 0
        }
            
    }

}





