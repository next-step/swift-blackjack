//
//  CardDeck.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

protocol CardDeck {
    var cards: [Card] { get }
    var cardScoreRule: CardScoreRule.Type { get }
    func append(card: Card)
    func countScore() -> Int
    func isBlackjack() -> Bool
}

class BlackjackCardDeck: CardDeck {
    private(set) var cards: [Card] = []
    let cardScoreRule: CardScoreRule.Type = BlackjackScoreRule.self

    func append(card: Card) {
        cards.append(card)
    }
    
    func countScore() -> Int {
        return cardScoreRule.countScore(cardDeck: self)
    }
    
    func isBlackjack() -> Bool {
        return cards.count == 2 && countScore() == BlackjackScoreRule.twentyOne
    }
}
