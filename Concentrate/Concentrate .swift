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
    var indexOfOneAndOnlyFaceUpCard: Int?
    //choose card by index of the array
    func chooseCard( at index: Int){
        if !cards[index].isMatchCard{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatchCard = true
                    cards[index].isMatchCard = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
           
            let card = Card()
            //structs get copied when they are assigned so
            cards += [card, card]
        }
    }
}
