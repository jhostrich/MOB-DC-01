//
//  CardGame.swift
//  Assessment 3_JO
//
//  Created by Johanna Ostrich on 1/24/15.
//  Copyright (c) 2015 Johanna Ostrich. All rights reserved.
//

import Foundation

protocol BlackJack {
    func deal() -> String
    func firstHand() -> String
}

class CardGame: BlackJack {
    
    // Generate new player
    var cardPlayer = Player(name: "Card Player")
    var handSum = 0
    var houseHandSum = 0
    var gameOver = false
    
    // Deal whole hand to House--assumes House never busts
    // Use arc4random_uniform(n) for a random integer between 0 and n-1
    func houseHand() -> Int {
        houseHandSum = Int(arc4random_uniform(10)+12)
        return houseHandSum
    }
    
    // Deal first hand to Card Player
    func firstHand() -> String {
        houseHand()
        let card1 = Int(arc4random_uniform(10)+1)
        let card2 = Int(arc4random_uniform(10)+1)
        handSum = card1 + card2
        return "You have \(handSum) in your hand. \nThe house has \(houseHandSum)."
    }
    
    // Use to disable gesture buttons once game is over
    func gameOverNow() {
        gameOver = true
    }
    
    // Get more cards
    func deal() -> String {
        let card3 = Int(arc4random_uniform(10)+1)
        handSum += card3
        if handSum > 21 {
            gameOverNow()
            return "You drew a \(card3). \nYou now have \(handSum) in your hand. \nGame over, you lose!"
        } else {
            return "You drew a \(card3). \nYou now have \(handSum) in your hand. \nThe house still has \(houseHandSum)."
        }
    }
 
    // End game
    func endGame() -> String {
        gameOverNow()
        if handSum > houseHandSum {
            return "You have \(handSum). \nThe house has \(houseHandSum). \nYou win!"
        } else {
            return "You have \(handSum). \nThe house has \(houseHandSum). \nYou lose!"
        }
    }
    
}
