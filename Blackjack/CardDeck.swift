//
//  CardDeck.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

protocol CardDeck {
    var cards: [Card] { get }
    func append(card: Card)
}

class BlackjackCardDeck: CardDeck {
    private(set) var cards: [Card] = []

    func append(card: Card) {
        cards.append(card)
    }
}
