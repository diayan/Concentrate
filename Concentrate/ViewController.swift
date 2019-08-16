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
    lazy var game = Concentrate(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    //didset is a property observer that is used to update the property any time the value changes
    var flipCount = 0{didSet{flipCountLabel.text = "flips:\(flipCount)"}}
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    //array of UIButtons
    @IBOutlet var cardButtons: [UIButton]!
    
    //array of emojies: perenthesis is used to show an array
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("card chosen is not in card buttons")
        }
    }

    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatchCard ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃","🙀","👻","👿","🎃","👻","🙀","🥶","👿","🥶"]
    
    //var emoji = Dictionary<Int, String>() fancy way of creating a dictionary
    var emoji = [Int : String]()
     
    func emoji(for card: Card) -> String{
        
        //used the to indicate another if statement that would have been nested
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //remove at lets you remove card after picking so that you don't have an identifier repeating it's self
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //return an emoji with the identifier specified else return a question mark
         return  emoji[card.identifier] ?? "?"
    }
}

