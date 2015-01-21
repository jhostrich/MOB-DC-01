// Playground - noun: a place where people can play

import UIKit

//---------------------------------

class Player {
    var health = 100
    var alive = true

    // not using right now
    func isAlive() {
        if health > 0 {
            alive = true
        } else {
            alive = false
        }
    }
    
    func attackDamage() -> Int {
        let playerDamage = Int(rand() % 20)
        return playerDamage
    }
    
}


//---------------------------------

class GoodPlayer: Player {
    var name: String
    var victoryIsMine = "Our hero!"
    let goodHit = ("Pow!")

    init (name: String) {
        self.name = name
    }
    
}


//---------------------------------

class BadPlayer: Player {
    var name: String
    var victoryIsMine = "Mwahaha!"
    let badHit = ("Bam!")

    init (name: String) {
        self.name = name
    }
    
}


//---------------------------------

class Match {
    var goodPlayer = GoodPlayer(name: "Good Guy")
    var badPlayer = BadPlayer(name: "Bad Guy")
    

    
    func victoryMessage() {
        //while goodPlayer.isAlive() && badPlayer.isAlive() {
        if goodPlayer.health <= 0 && badPlayer.health <= 0 {
            println("Draw")
        } else if goodPlayer.health <= 0 {
            println("\(badPlayer.victoryIsMine)! \(badPlayer.name) has triumphed!")
        } else if badPlayer.health <= 0 {
            println("\(goodPlayer.victoryIsMine)! \(goodPlayer.name) has triumphed!")
        }
    }
    
    
    func playGame() {
        println("The epic death match has begun! Featuring \(goodPlayer.name) vs. \(badPlayer.name)!")
        while goodPlayer.health > 0 && badPlayer.health > 0 {
            var player1damage = goodPlayer.attackDamage()
            badPlayer.health -= player1damage
            println("\(goodPlayer.goodHit)")
            var player2damage = badPlayer.attackDamage()
            goodPlayer.health -= player2damage
            println("\(badPlayer.badHit)")
        }
        victoryMessage()
     }
    
}

var match1 = Match()
match1.playGame()
var match2 = Match()
match2.playGame()
