//
//  Deck.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct Deck {
    var cards: [Card]
    
    init() {
        cards = Denomination.allCases.reduce(into: []) { partialResult, denomination in
            Suit.allCases.forEach { suit in
                partialResult.append(Card(suit: suit, denomination: denomination))
            }
        }.shuffled()
    }
}
