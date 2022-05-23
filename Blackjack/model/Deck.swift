//
//  Deck.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

protocol Deckable {
    func shuffle()
    func deal() -> Card
}

class Deck: Deckable, CustomDebugStringConvertible {
    let deck: Cards
    var removedDeck: Cards = Cards()
    
    var count: Int {
        deck.count
    }
    
    var debugDescription: String {
        String(describing: deck)
    }
    
    init() {
        self.deck = Cards(CardType.allCases.flatMap { (type) in
            CardElement.allCases.map { (type2) in
                Card(type, type2)
            }
        })
    }
    
    func shuffle() {
        deck.shuffle()
    }
    
    func deal() -> Card {
        let drawCard = deck.random
        removedDeck.append(drawCard)
        return drawCard
    }
}
