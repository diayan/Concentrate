//
//  Card.swift
//  Concentrate
//
//  Created by Ampersand on 14/04/2019.
//  Copyright © 2019 Ampersand. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatchCard = false
    var identifier: Int
    
    //think of static variables or methods as utils where you don't have to intantiate the class before using them 
    //static variable can only be called by the Card type
    static var cardIdentifierFactory = 0
    
    //generate a unique card identifier each time
    static func getUniqueIdentifier() -> Int{
        cardIdentifierFactory += 1
        return cardIdentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
