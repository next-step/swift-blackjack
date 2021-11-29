//
//  Lose.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/29.
//

import Foundation

struct Lose: Finished {
	var deck: Deck
	let earningRate: Double = -1.0
	
	func profit(bet: Bet, winning: Winning) -> Double {
		let betAmount = Double(bet.amount)
		return betAmount * earningRate
	}
}
