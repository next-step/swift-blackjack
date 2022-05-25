//
//  Dealer.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

class Dealer: Gamer {
    
    enum DealerError: LocalizedError {
        case noCards
        
        var errorDescription: String? {
            switch self {
            case .noCards:
                return "더 이상 뽑을 카드가 없습니다"
            }
        }
    }
    
    private enum Constants {
        static let name: String = "딜러"
    }
    
    private var deck: Deck
    
    init(deck: Deck = Deck()) {
        self.deck = deck
        super.init(name: Constants.name)
    }
    
    func drawCard() throws -> Card {
        guard let card = deck.removeFirst() else {
            throw DealerError.noCards
        }
        return card
    }
}
