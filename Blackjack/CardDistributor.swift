//
//  CardDistributor.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

protocol CardDistributor {
    func distribute(count: Int) -> [Card]
}

class NonDuplicateCardDistributor: CardDistributor {
    private(set) var cards: [Card]
    let cardPickStrategy: CardPickStrategy
    
    init(cards: [Card], cardPickStrategy: CardPickStrategy) {
        self.cards = Array(cards)
        self.cardPickStrategy = cardPickStrategy
    }
    
    func distribute(count: Int = 1) -> [Card] {
        (0..<count).map { _ in
            let card = cardPickStrategy.pick(among: cards)
            cards.removeAll { $0 == card }
            return card
        }
    }
}
