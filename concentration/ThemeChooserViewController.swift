//
//  ThemeChooserViewController.swift
//  concentration
//
//  Created by mac on 7/13/20.
//  Copyright © 2020 tanacom limited. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {
    
    
    let themes = [
        "Sports"   : "⚽️🏀🏈⚾️🏓⛸🥌🎱🏑⛷🥊🏐",
        "Animals"  : "🦜🦄🐙🐇🐩🦆🐅🐊🐋🐪🦓🐒",
        "Faces"    : "🐭🥰😻💩😡😀🦊👮🏻‍♂️💂🏻🤦🏻‍♂️🤠🥴",
        "Halloween": "👻🎃🦅👹🕸🕷💀🐺🐞🧟‍♂️🏴‍☠️🧛🏻‍♂️",
    
    ]
    
    
    @IBAction func changeTheme(_ sender: Any) {
        
          performSegue(withIdentifier: "Choose Theme", sender: sender)
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          if segue.identifier == "Choose Theme" {
            
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                
                        if let cvc = segue.destination as? ConcentrationViewController {
                            cvc.theme = theme
                          //  lastSeguedConcentrationViewController = cvc
                        }
                    }
              
         
              }
              
            
    }
    
    
    

}
