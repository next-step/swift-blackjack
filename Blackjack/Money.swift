//
//  Money.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

struct Money: Equatable {
g    static func + (lhs: Money, rhs: Money) -> Money {
        return Money(lhs.value + rhs.value)!
    }
    
    static let zero = Money(.zero)!
    
    let value: Int
    
    init?(_ value: Int) {
        if value < .zero { return nil }
        self.value = value
    }
    
    func blackjackWinningMoney() -> Money {
        let winningMoneyValue = Int(Double(value) * 1.5)
        return Money(winningMoneyValue)!
    }
}

