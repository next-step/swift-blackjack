//
//  GameState.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/29.
//

import Foundation

protocol GameState {
	var deck: Deck { get set }
	var isFinished: Bool { get }
	func draw(card: BlackjackCard) -> GameState
	func stay() -> GameState
	func profit(bet: Bet, winning: Winning) -> Double
}

protocol Finished: GameState {
	var earningRate: Double { get }
}

extension Finished {
	var isFinished: Bool { true }
	func draw(card: BlackjackCard) -> GameState {
		return self
	}
	func stay() -> GameState {
		return self
	}
	func profit(bet: Bet, winning: Winning) -> Double {
		let betAmount = Double(bet.amount)
		return betAmount + betAmount * earningRate
	}
}

protocol Running: GameState {
	init(deck: Deck)
}

extension Running {
	var isFinished: Bool { false }
	func profit(bet: Bet, winning: Winning) -> Double {
		Double(bet.amount)
	}
}
