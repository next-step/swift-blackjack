//
//  Money.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

struct Money {
    static func / (lhs: Money, rhs: Money) -> Int {
        return lhs.value / rhs.value
    }
    
    static func * (lhs: Money, rhs: Money) -> Int {
        return lhs.value * rhs.value
    }
    
    let value: Int
    
    init?(value: Int) {
        if value < .zero { return nil }
        self.value = value
    }
}
