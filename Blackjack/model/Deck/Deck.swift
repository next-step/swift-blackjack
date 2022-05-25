//
//  Deck.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

protocol Deckable {
    func drawCard() throws -> Card
}

class Deck: Deckable {
    var deck: [Card]
    
    var count: Int {
        deck.count
    }
    
    init() {
        self.deck = CardType.allCases.flatMap { (cardType) in
            CardElement.allCases.map { (cardElement) in
                Card(cardType, cardElement)
            }
        }.shuffled()
    }
    
    func drawCard() throws -> Card {
        guard let card = deck.popLast() else {
            throw CardError.noCards
        }
        return card
    }
}

extension Deck: CustomDebugStringConvertible {
    var debugDescription: String {
        String(describing: deck)
    }
}
