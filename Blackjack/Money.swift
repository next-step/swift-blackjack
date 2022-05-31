//
//  Money.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

struct Money: Equatable {
    static func * (lhs: Money, rhs: NSNumber) -> Money? {
        let value = Double(lhs.value) * Double(truncating: rhs)
        return Money(Int(value))
    }
    
    static func + (lhs: Money, rhs: Money) -> Money {
        return Money(lhs.value + rhs.value)!
    }
    
    static let zero = Money(.zero)!
    let value: Int
    
    init?(_ value: Int) {
        if value < .zero { return nil }
        self.value = value
    }
}

