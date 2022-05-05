//
//  Hand.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

protocol HandProtocol {
    func score() -> Int
}

struct Hand: HandProtocol {
    private var cards: [Card]
    private let winningScore: WinningScore
    
    init?(cards: [Card], winningScore: WinningScore) {
        guard cards.count > 0 else { return nil }
        self.cards = cards
        self.winningScore = winningScore
    }
    
    func score() -> Int {
        var firstSelectableScore: Int = 0
        var lastSelectableScore: Int = 0
        
        cards.forEach { card in
            firstSelectableScore += card.judgeScore().firstSelectableScore()
            lastSelectableScore += card.judgeScore().lastSelectableScore()
        }

        return selectScore(firstSelectableScore: firstSelectableScore,
                           lastSelectableScore: lastSelectableScore)
    }
    
    func selectScore(firstSelectableScore: Int, lastSelectableScore: Int) -> Int {
        guard firstSelectableScore != lastSelectableScore else { return firstSelectableScore }
        guard firstSelectableScore < winningScore.number && lastSelectableScore > winningScore.number else {
            return lastSelectableScore
        }
        guard lastSelectableScore < winningScore.number && firstSelectableScore > winningScore.number else {
            return firstSelectableScore
        }
        
        let compareNuber: Int = winningScore.number - firstSelectableScore
        return (winningScore.number - lastSelectableScore) > compareNuber ? firstSelectableScore : lastSelectableScore
    }
}

