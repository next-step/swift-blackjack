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

class CardDeck: Equatable, CardDeckProtocol {
    private var cards: [Card]
    
    init?(cards: [Card]) {
        guard cards.count > 0 else { return nil }
        self.cards = cards
    }
    
    func count() -> Int {
        cards.count
    }
    
    func shuffle() {
        var swappedIndexes: [Int] = []
        var shuffledCards = cards
        
        func swapCardWithRandomFollowingCard(index: Int) {
            let randomIndex = index +
                Int(arc4random_uniform(UInt32(count() - index)))
            shuffledCards.swapAt(index, randomIndex)
            swappedIndexes.append(randomIndex)
        }
        
        for index in 0..<count() {
            let cardWasNotSwappedYet = !swappedIndexes.contains(index)
            guard cardWasNotSwappedYet else {
                continue
            }
            swapCardWithRandomFollowingCard(index: index)
        }
        
        self.cards = shuffledCards
    }
    
    func handOutCard() -> Card {
        cards.removeLast()
    }
    
    func makeHand() -> HandProtocol? {
        let cards: [Card] = [self.handOutCard(), self.handOutCard()]
        return Hand(cards: cards)
    }
}

extension CardDeck {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        lhs.cards == rhs.cards
    }
}
