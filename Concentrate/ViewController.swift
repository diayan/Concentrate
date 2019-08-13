//
//  ViewController.swift
//  Concentrate
//
//  Created by Ampersand on 04/03/2019.
//  Copyright © 2019 Ampersand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*initialize our model which serves as a pointer from our controller to our model*/
    var game = Concentrate()
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on:sender)
        }else{
            print("card chosen is not in card buttons")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button : UIButton){
        //print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
}

