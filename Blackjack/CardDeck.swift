//
//  CardDeck.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

protocol CardDeckProtocol {
    func count() -> Int
    func shuffle()
    func handOutCard() -> Card
    func makeHand() -> HandProtocol?
}

class CardDeck: CardDeckProtocol {
    private var cards: [Card]
    
    init?(cards: [Card]) {
        guard cards.count > 0 else { return nil }
        self.cards = cards
    }
    
    func count() -> Int {
        cards.count
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func handOutCard() -> Card {
        cards.removeLast()
    }
    
    func makeHand() -> HandProtocol? {
        let cards: [Card] = [self.handOutCard(), self.handOutCard()]
        return Hand(cards: cards)
    }
}
