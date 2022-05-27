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
    func isExceedWinningScore() -> Bool
}

class Hand: HandProtocol {
    private var cards: [Card]
    
    init(cards: [Card] = []) {
        self.cards = cards
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
    
    func isExceedWinningScore() -> Bool {
        score() > WinningScore.number
    }
    
    func hit(card: Card) {
        cards.append(card)
    }
    
    func selectScore(firstSelectableScore: Int, lastSelectableScore: Int) -> Int {
        guard firstSelectableScore != lastSelectableScore else { return firstSelectableScore }
        guard firstSelectableScore < WinningScore.number && lastSelectableScore > WinningScore.number else {
            return lastSelectableScore
        }
        guard lastSelectableScore < WinningScore.number && firstSelectableScore > WinningScore.number else {
            return firstSelectableScore
        }
        
        let compareNuber: Int = WinningScore.number - firstSelectableScore
        return (WinningScore.number - lastSelectableScore) > compareNuber ? firstSelectableScore : lastSelectableScore
    }
}

