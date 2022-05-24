//
//  Player.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

protocol Playable {
    mutating func deal(_ element: Card) throws
}

struct Player: Playable {
    let name: String
    var cards: Cards
    
    init(name: String, _ cards: Cards = Cards()) {
        self.name = name
        self.cards = cards
    }
    
    mutating func deal(_ element: Card) throws {
        guard cards.result() <= Constants.winningNumber else {
            throw CardError.outOfValue
        }
        cards.add(element)
    }
}
