//
//  CardDistributor.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

protocol CardDistributor {
    func distribute(count: Int) throws -> [Card]
}

class NonDuplicateCardDistributor: CardDistributor {
    enum Error: LocalizedError {
        case outOfCard
        
        var errorDescription: String? {
            switch self {
            case .outOfCard: return "카드가 부족합니다."
            }
        }
        
    }
    private(set) var cards: [Card]
    let cardPickStrategy: CardPickStrategy
    
    init(cards: [Card], cardPickStrategy: CardPickStrategy) {
        self.cards = Array(cards)
        self.cardPickStrategy = cardPickStrategy
    }
    
    func distribute(count: Int = 1) throws -> [Card] {
        let pickedCards = try (0..<count).map { _  in
            return try pickCard()
        }
        
        pickedCards.forEach { card in
            cards.removeAll { $0 == card }
        }
        return pickedCards
    }
    
    func pickCard() throws -> Card {
        guard let card = cardPickStrategy.pick(among: cards) else {
            throw Error.outOfCard
        }
        return card
    }
}
