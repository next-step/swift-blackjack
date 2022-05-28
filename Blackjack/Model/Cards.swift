//
//  Cards.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/28.
//

import Foundation

final class Cards {
    
    private (set) var cards: [Card]
    private let cardCalculator = CardCalculator()
    private let thresholdChecker = ThresholdChecker()
    
    var count: Int {
        cards.count
    }
    var totalPoint: Int {
        cardCalculator.calcuate(of: cards)
    }
    var isBurst: Bool {
        !thresholdChecker.isTotalPointUnderThreshold(of: cards)
    }
    var description: String {
        cards.map { card in
            let denomination: String = card.denomination.guideDescription
            let suit: String = card.suit.guideDescription
            return denomination + suit
        }.joined(separator: ", ")
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func append(_ card: Card) {
        guard !isBurst else {
            return
        }
        cards.append(card)
    }
}
