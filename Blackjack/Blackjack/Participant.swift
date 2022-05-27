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
        for card in cards.filter({ $0.number != .ace }) {
            value += card.value
        }
        
        for card in cards.filter({ $0.number == .ace }) {
            let lessValue = value + 1
            let moreValue = value + 11
            
            if abs(moreValue - 21) < abs(lessValue - 21) {
                value = moreValue
            } else {
                value = lessValue
            }
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
