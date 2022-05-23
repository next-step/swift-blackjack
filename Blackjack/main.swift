//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

protocol Playable {
    func add(_ element: Card)
}

class Player: Playable {
    let name: String
    var cards: Cards
    
    init(name: String, _ cards: Cards = Cards()) {
        self.name = name
        self.cards = cards
    }
    
    func add(_ element: Card) {
        cards.append(element)
    }
}

var deck = Deck()
let player1: Player = Player(name: "uchan")
let player2: Player = Player(name: "hui")

for _ in 1...2 {
    player1.add(deck.deal())
}

for _ in 1...2 {
    player2.add(deck.deal())
}

print(player1.cards)
print(player2.cards)

//print("\(player1.name): \(player1.cards.sum)")
//print("\(player2.name): \(player2.cards.sum)")

import Foundation

