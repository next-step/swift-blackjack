//
//  Deck.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

protocol Deckable {
    func draw(cards: Cards) throws -> Card
}

struct Deck: CustomDebugStringConvertible {
    var deck: [Card]
    
    var count: Int {
        deck.count
    }
    
    var debugDescription: String {
        String(describing: deck)
    }
    
    init() {
        self.deck = CardType.allCases.flatMap { (cardType) in
            CardElement.allCases.map { (cardElement) in
                Card(cardType, cardElement)
            }
        }.shuffled()
    }
    
    mutating func drawCard() throws -> Card {
        guard let card = deck.popLast() else {
            throw CardError.noCards
        }
        return card
    }
}
