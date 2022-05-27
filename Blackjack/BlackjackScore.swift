//
//  BlackjackScore.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

struct BlackjackScores {
    private let value: [BlackjackScore]
    var playerScores: [BlackjackScore] {
        value.filter { ($0.player is Dealer) == false }
    }
    
    var dealerScore: BlackjackScore? {
        value.filter { $0.player is Dealer }.first
    }
    
    init(_ value: [BlackjackScore]) {
        self.value = value
    }
}

struct BlackjackScore: Comparable {
    static func < (lhs: BlackjackScore, rhs: BlackjackScore) -> Bool {
        lhs.score < rhs.score
    }
    
    static func == (lhs: BlackjackScore, rhs: BlackjackScore) -> Bool {
        return lhs.player == rhs.player
            && lhs.score == rhs.score
    }
    
    let player: Player
    let score: Int
    
    func isBigger(than score: Int) -> Bool {
        self.score > score
    }
}
