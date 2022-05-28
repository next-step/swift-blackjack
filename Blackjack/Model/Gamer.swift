//
//  Gamer.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

class Gamer {
    
    enum State {
        case hit
        case stay
    }
    
    let name: String
    var bettingMoney: Double
    var state: State
    var cards: Cards
    
    init(name: String) {
        self.name = name
        self.bettingMoney = 0
        self.cards = Cards(cards: [])
        self.state = .hit
    }
    
    func appendCard(_ card: Card) {
        cards.append(card)
    }
}
