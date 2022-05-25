//
//  CardDeckGenerator.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

struct CardDeckGenerator {
    static func generate() -> [Card] {
        var cards: [Card] = []
        
        Card.Suit.allCases.forEach { suit in
            generateCard(suit: suit)
        }
        
        func generateCard(suit: Card.Suit) {
            Rank.allCases.forEach { rank in
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        
        return cards
    }
}
