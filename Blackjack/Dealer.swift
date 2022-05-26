//
//  Dealer.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

class Dealer: Player {
    init(cardDeck: CardDeck) {
        super.init(name: PlayerName("딜러")!, cardDeck: cardDeck)
    }
    
    func answer() {
        countScore()
    }
    
}
