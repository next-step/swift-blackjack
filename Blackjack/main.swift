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
let uchan: Player = Player(name: "uchan")

for _ in 1...2 {
    uchan.add(deck.deal())
}
print(uchan.cards)

import Foundation

