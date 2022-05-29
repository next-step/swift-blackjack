//
//  Player.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

class Player {
    let name: PlayerName
    let cardDeck: CardDeck
    
    init(name: PlayerName, cardDeck: CardDeck) {
        self.name = name
        self.cardDeck = cardDeck
    }
    
    func receive(cards: [Card]) {
        cards.forEach { cardDeck.append(card: $0) }
    }
    
    func countScore() -> Int {
        return cardDeck.countScore()
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name
    }
}
