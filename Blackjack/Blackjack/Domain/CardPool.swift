//
//  CardPool.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/28.
//

import Foundation

struct CardPool {
    private var cards = Card.allCards
    
    mutating func generateRandomCard() throws -> Card {
        guard let card = self.cards.randomElement() else { throw BlackjackError.failedGenerateCard }
        self.cards = self.cards.filter({ $0.number != card.number || $0.shape != card.shape })
        return card
    }
}
