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


