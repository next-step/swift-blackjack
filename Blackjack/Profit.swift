//
//  Profit.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

struct Profits {
    let value: [Profit]
}

protocol Profit {
    var player: Player { get }
    var money: Money { get }
    func plus(_ profit: Profit) -> Profit
    func minus(_ profit: Profit) -> Profit
}

extension Profit {
    func plus(_ profit: Profit) -> Profit {
        let value = self.money.value + profit.money.value
        if value > .zero {
            return PlusProfit(player: player, money: Money(value)!)
        }
        if value < .zero {
            return MinusProfit(player: player, money: Money(-value)!)
        }
        return ZeroProfit(player: player)
    }
    
    func minus(_ profit: Profit) -> Profit {
        let value = self.money.value - profit.money.value
        if value < .zero {
            return MinusProfit(player: player, money: Money(-value)!)
        }
        if value > .zero {
            return PlusProfit(player: player, money: Money(value)!)
        }
        return ZeroProfit(player: player)
    }
}

struct PlusProfit: Profit {
    let player: Player
    let money: Money
}

struct MinusProfit: Profit {
    let player: Player
    let money: Money
}

struct ZeroProfit: Profit {
    let player: Player
    let money: Money = .zero
}


