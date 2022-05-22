//
//  Dealer.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct Dealer {
    
    private var deck = Deck()
    
    mutating func drawCard() -> Card? {
        guard !deck.cards.isEmpty else {
            return nil
        }
        return deck.cards.removeFirst()
    }
}
