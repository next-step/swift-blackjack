//
//  Participant.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

class Participant {
    let name: String
    var cards: [Card] = []
    
    var score: Int {
        var value: Int = 0
        for card in cards {
            value += card.value
        }
        return value
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: Card) {
        cards.append(card)
    }
}
