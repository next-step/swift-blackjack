//
//  ThresholdChecker.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct ThresholdChecker {
    
    enum Constants {
        static let threshold: Int = 21
    }
    
    private let cardCalculator = CardCalculator()
    
    func isTotalPointUnderThreshold(of cards: [Card]) -> Bool {
        let isTotalPointUnderThreshold: Bool = cardCalculator.calcuate(of: cards) <= Constants.threshold
        return isTotalPointUnderThreshold
    }
}
