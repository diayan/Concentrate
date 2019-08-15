//
//  Concentrate .swift
//  Concentrate
//
//  Created by Ampersand on 14/04/2019.
//  Copyright © 2019 Ampersand. All rights reserved.
//

import Foundation

class Concentrate
{
    //initialize an array of card objects
    var cards =  [Card]()
    
    //choose card by index of the array
    func chooseCard( at index: Int){
        
        if cards[index].isFaceUp{
            cards[index].isFaceUp = true
        }else{
            cards[index].isFaceUp = false
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
           
            let card = Card()
            //structs get copied when they are assigned so
            cards = [card, card]
        }
    }
}
