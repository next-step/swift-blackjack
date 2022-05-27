//
//  BlackjackScore.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

struct BlackjackScore: Comparable {
    static func < (lhs: BlackjackScore, rhs: BlackjackScore) -> Bool {
        lhs.score < rhs.score
    }
    
    static func == (lhs: BlackjackScore, rhs: BlackjackScore) -> Bool {
        lhs.score == rhs.score
    }
    
    let player: Player
    let score: Int
    
    func isBigger(than score: Int) -> Bool {
        self.score > score
    }
}
