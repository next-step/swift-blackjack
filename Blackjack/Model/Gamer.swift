//
//  Gamer.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

class Gamer {
    
    enum State {
        case hit
        case stay
    }
    
    private let cardCalculator = CardCalculator()
    private let thresholdChecker = ThresholdChecker()
    let name: String
    var cards: [Card]
    var state: State
    var isBurst: Bool {
        !thresholdChecker.isTotalPointUnderThreshold(of: cards)
    }
    var totalPoint: Int {
        cardCalculator.calcuate(of: cards)
    }
    
    init(name: String) {
        self.name = name
        self.cards = []
        self.state = .hit
    }
    
    func appendCard(_ card: Card) {
        guard !isBurst else {
            return
        }
        let appendedCards: [Card] = cards + [card]
        cards = appendedCards
    }
}
