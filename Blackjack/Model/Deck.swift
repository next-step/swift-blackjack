//
//  Deck.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

final class Deck {
    
    private(set) var cards: [Card]
    
    init(cards: [Card] = Deck.makeInitialCards()) {
        self.cards = cards
    }
    
    func removeFirst() -> Card? {
        guard !cards.isEmpty else {
            return nil
        }
        return cards.removeFirst()
    }
    
    static func makeInitialCards() -> [Card] {
        return Denomination.allCases.reduce(into: []) { partialResult, denomination in
            Suit.allCases.forEach { suit in
                partialResult.append(Card(suit: suit, denomination: denomination))
            }
        }.shuffled()
    }
}
