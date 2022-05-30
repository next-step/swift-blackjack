//
//  Dealer.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

class Dealer: Participant {
    enum State {
        case needToCard
        case enoughCard
    }
    
    convenience init() {
        self.init(name: "딜러")
    }
    
    var state: State {
        if score <= 16 {
            return .needToCard
        }
        return .enoughCard
    }
}
