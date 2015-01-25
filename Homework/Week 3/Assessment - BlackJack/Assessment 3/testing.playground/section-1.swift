// Playground - noun: a place where people can play

import UIKit

/*
- When card game first starts, a new player is generated and handed out 2 cards (between 1 and 11)
  so on load, var newPlayer, generate 2 random numbers and add together
var newPlayer
let card1 = Int(rand() % 11)
let card2 = Int(rand() % 11)
var handSum = card1 + card2


*/

//Use arc4random_uniform(n) for a random integer between 0 and n-1
func houseHand() -> Int {
    let houseCardAmount = Int(arc4random_uniform(10)+12)
    return houseCardAmount
}

protocol BlackJack {
    func deal() -> Int
    func firstHand() -> Int
}


class Player {
    var name: String
    init(name: String) {
        self.name = name
    }
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

var newGame = CardGame()
newGame.houseHand()
newGame.firstHand()
newGame.deal()
