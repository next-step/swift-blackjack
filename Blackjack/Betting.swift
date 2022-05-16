//
//  Betting.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/10.
//

import Foundation

protocol BettingProtocol {
    func profit(isWin: Bool, isExceedWinningScore: Bool) -> Int
    func bettingAmount() -> Int
    func firstHandBlackjack()
}

class Betting: BettingProtocol {
    private var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func bettingAmount() -> Int {
        amount
    }
    
    func firstHandBlackjack() {
        amount = Int(Double(amount) * 1.5)
    }
    
    func profit(isWin: Bool, isExceedWinningScore: Bool) -> Int {
        guard !isExceedWinningScore else { return -amount }
        guard isWin else { return -amount }
        return amount
    }
}
