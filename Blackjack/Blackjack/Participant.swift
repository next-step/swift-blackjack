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
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: Card) {
        cards.append(card)
    }
}
