//
//  Dealer.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

class Dealer {
    
    enum DealerError: LocalizedError {
        case noCards
        
        var errorDescription: String? {
            switch self {
            case .noCards:
                return "더 이상 뽑을 카드가 없습니다"
            }
        }
    }
    
    private var deck: Deck
    
    init(deck: Deck = Deck()) {
        self.deck = deck
    }
    
    func drawCard() throws -> Card {
        guard let card = deck.removeFirst() else {
            throw DealerError.noCards
        }
        return card
    }
}
