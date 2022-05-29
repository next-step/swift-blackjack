//
//  ProfitsFormatter.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/30.
//

import Foundation

struct ProfitsFormatter {
    static func format(profits: Profits) -> String {
        return profits.value.map {
            text(from: $0)
        }.reduce("") { partialResult, text in
            partialResult + "\n" + text
        }
    }
    
    static func text(from profit: Profit) -> String {
        if profit is MinusProfit {
            return "\(profit.player.name): -\(profit.money.value)"
        }
        return "\(profit.player.name): \(profit.money.value)"
    }
}
