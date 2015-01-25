//
//  CardGame.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation

protocol BlackJack {
    func deal() -> Int
    func firstHand() -> Int
}

class CardGame: BlackJack {
    
    // Generate new player
    var cardPlayer = Player(name: "Card Player")
    var handSum = 0
    
    // Deal whole hand to House--assumes House never busts
    // Use arc4random_uniform(n) for a random integer between 0 and n-1
    func houseHand() -> Int {
        let houseCardAmount = Int(arc4random_uniform(10)+12)
        return houseCardAmount
    }

    // Deal first hand to Card Player
    func firstHand() -> Int {
        let card1 = Int(rand() % 11)
        let card2 = Int(rand() % 11)
        handSum = card1 + card2
        return handSum
    }

    
    // Get more cards
    func deal() -> Int {
        let card3 = Int(rand() % 11)
        handSum += card3
        return handSum
    }
    
}
