//
//  ViewController.swift
//  concentration
//
//  Created by mac on 12/28/19.
//  Copyright © 2019 tanacom limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //No need to declare variable type in swift.
    var flipCount = 0 {
        
    didSet {
       flipCountLabel.text = "Flip Counts : \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
    flipCount += 1
        
//    print("You clicked me")
        flipCard(withEmoji: "🧛", on: sender)
    }
    
    @IBAction func touchCard2(_ sender: UIButton) {
        
        flipCount += 1
        
//        flipCountLabel.text = "Flip Counts : \(flipCount)"
        
        flipCard(withEmoji: "👑", on: sender)
    }
    
    
    //function flipCard
    func flipCard(withEmoji emoji :String, on button:UIButton){
        
        
//        print("PrintCard with Emoji : \(emoji))")
        
        if button.currentTitle == emoji {
          
            button.setTitle("", for: UIControl.State.normal)
            
            button.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        }
        else{
            button.setTitle(emoji, for:UIControl.State.normal)
            
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
    }
    
    
    
    
}

