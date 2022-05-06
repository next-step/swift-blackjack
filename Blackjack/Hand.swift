//
//  Hand.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

protocol HandProtocol {
    func score() -> Int
    func hit(card: Card)
    func giveHandDescription() -> String
}

class Hand: HandProtocol {
    private var cards: [Card]
    private let winningScore: WinningScore
    
    init(cards: [Card] = [], winningScore: WinningScore = WinningScore()) {
        self.cards = cards
        self.winningScore = winningScore
    }
    
    func giveHandDescription() -> String {
        var description: String = ""
        
        cards.forEach { card in
            description += "\(card.description()), "
        }
        
        description.removeLast()
        description.removeLast()
        return description
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
    
    func hit(card: Card) {
        cards.append(card)
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

