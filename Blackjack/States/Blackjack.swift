//
//  Blackjack.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/29.
//

import Foundation

struct Blackjack: Finished {
	var deck: Deck
	let earningRate: Double = 1.5
	
	func profit(bet: Bet, winning: Winning) -> Double {
		if isPush(winning: winning) { return Push(deck: deck).profit(bet: bet, winning: winning) }
		
		let betAmount = Double(bet.amount)
		return betAmount + betAmount * earningRate
	}
	
	private func isPush(winning: Winning) -> Bool {
		return winning == .push
	}
}
