//
//  Participant.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

class Participant {
    let name: String
    var cards: [Card] = []
    
    var score: Int {
        let currentScore = calculateScoreWithoutAce()
        return calculateAceScore(startAt: currentScore)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    private func calculateScoreWithoutAce() -> Int {
        return cards.filter({ $0.number != .ace })
            .reduce(0, { $0 + $1.value })
    }
    
    private func calculateAceScore(startAt score: Int) -> Int {
        var now = score
        for _ in cards.filter({ $0.number == .ace }) {
            now = selectSuperiorScore(lhs: now + 1, rhs: now + 11)
        }
        return now
    }
    
    private func selectSuperiorScore(lhs: Int, rhs: Int) -> Int {
        return abs(lhs - 21) < abs(rhs - 21) ? lhs : rhs
    }
}
