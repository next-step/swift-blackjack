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
        let currentScore = calculateScore()
        return calculateAdditionalAceScore(current: currentScore)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    private func calculateScore() -> Int {
        return cards.reduce(0, { $0 + $1.value })
    }
    
    private func calculateAdditionalAceScore(current score: Int) -> Int {
        var now = score
        for _ in cards.filter({ $0.number == .ace }) {
            now = selectSuperiorScore(lhs: now, rhs: now + Card.additionalAceScore)
        }
        return now
    }
    
    private func selectSuperiorScore(lhs: Int, rhs: Int) -> Int {
        return abs(lhs - 21) < abs(rhs - 21) ? lhs : rhs
    }
}
