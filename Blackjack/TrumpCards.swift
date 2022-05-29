//
//  TrumpCard.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

enum TrumpCards {
    static var value: [Card] {
        return Card.Rank.allCases
            .map { cardId in
                allCards(with: cardId, suits: Card.Suit.allCases)
            }
            .flatMap { $0 }
    }
    
    private static func allCards(with rank: Card.Rank, suits: [Card.Suit]) -> [Card] {
        return suits.map { suit in
            Card(rank: rank, suit: suit)
        }
    }
}
