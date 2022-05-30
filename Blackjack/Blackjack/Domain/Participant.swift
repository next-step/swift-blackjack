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
        let aceCount = cards.filter({ $0.number == .ace }).count
        let calcuated = selectSuperiorAceScore(now: score, count: aceCount)
        return calcuated
    }
    
    private func selectSuperiorAceScore(now: Int, count: Int) -> Int {
        let remainingValue: Int = 21 - now
        let addAvailableCount = remainingValue / 10
        
        if count <= addAvailableCount {
            return now + count * 10
        }
        return now + addAvailableCount * 10
    }
}
