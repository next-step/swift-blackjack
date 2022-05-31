//
//  Dealer.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

class Dealer: Player {
    enum State {
        case needToCard
        case enoughCard
    }
    
    convenience init() {
        self.init(name: "딜러")
    }
    
    var state: State {
        getState(by: score)
    }
    
    func calculateIncome(participants: [Participant]) -> Int {
        let participantsIncome: Int = participants
            .compactMap({ $0.calculateIncome(winningState: $0.isWin(compareWith: self)) })
            .reduce(0, +)
        return -1 * participantsIncome
    }
    
    private func getState(by score: Int) -> State {
        if score <= 16 {
            return .needToCard
        }
        return .enoughCard
    }
}
