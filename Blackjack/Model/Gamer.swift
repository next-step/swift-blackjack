//
//  Gamer.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct Gamer {
    
    enum GamerError: LocalizedError {
        case burst
        
        var errorDescription: String? {
            switch self {
            case .burst:
                return "총 합이 21을 초과했습니다"
            }
        }
    }
    
    private let cardCalculator = CardCalculator()
    private let thresholdChecker = ThresholdChecker()
    let name: String
    var cards: [Card]
    var totalPoint: Int {
        cardCalculator.calcuate(of: cards)
    }
    
    mutating func appendCard(_ card: Card) throws {
        let appendedCards: [Card] = cards + [card]
        
        guard thresholdChecker.isTotalPointUnderThreshold(of: appendedCards) else {
            throw GamerError.burst
        }
        
        cards = appendedCards
    }
}
