//
//  Participant.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct Participant {
    let name: String
    var cards: [Card] = []
    
    mutating func add(card: Card) {
        cards.append(card)
    }
}
