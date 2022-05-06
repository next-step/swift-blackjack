//
//  Card.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

struct Card {
    enum Suit: Character, CaseIterable {
        case hearts = "♥"
        case spades = "♠"
        case diamonds = "♦"
        case clubs = "♣"
    }
    
    private let rank: Rank
    private let suit: Suit
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    func description() -> String {
        "\(rank.description)\(suit.rawValue)"
    }
    
    func judgeScore() -> Judgeable {
        guard rank == .A else {
            return Judgment(judgeableScores: [Score.from(rank: rank)])
        }
        
        return judgeAce()
    }
    
    private func judgeAce() -> Judgeable {
        var judgment: Judgment = Judgment(judgeableScores: [])
        
        judgment.append(Score.from(rank: rank, aceUsingOne: true))
        judgment.append(Score.from(rank: rank, aceUsingOne: false))
        
        return judgment
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
