//
//  Card.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

struct Card {
    enum Suit: Character, CaseIterable {
        case hearts = "h"
        case spades = "s"
        case diamonds = "d"
        case clubs = "c"
    }
    
    private let rank: Rank
    private let suit: Suit
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    var description: String {
        "\(suit.rawValue)\(rank.description)"
    }
}

extension Card: Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}

extension Card: Comparable {
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank < rhs.rank
    }
}
