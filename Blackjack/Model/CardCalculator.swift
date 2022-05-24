//
//  CardCalculator.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct CardCalculator {
    
    func calcuate(of cards: [Card]) -> Int {
        let totalPoint: Int = totalPoint(of: cards)
        let result: Int = totalPoint + additionalPoint(in: cards)
        return result
    }
    
    private func totalPoint(of cards: [Card]) -> Int {
        let points: Int = cards
            .map { card -> Int in
                card.point
            }
            .reduce(0, +)
        return points
    }
    
    private func additionalPoint(in cards: [Card]) -> Int {
        let isContainAce: Bool = cards.map { card -> Denomination in
            card.denomination
        }.contains(.ace)
        
        guard isContainAce else {
            return 0
        }
        
        let totalPoint: Int = totalPoint(of: cards)
        let addablePointForAce: Int = Denomination.ace.addablePoint
        let isAddedPointUnderThreshold: Bool = totalPoint + addablePointForAce <= ThresholdChecker.Constants.threshold
        let additionalPoint: Int = isAddedPointUnderThreshold ? addablePointForAce : 0
        return additionalPoint
    }
}
