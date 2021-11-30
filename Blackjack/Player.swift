//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

protocol Resutable {
	associatedtype Value
	func gameResult(by calculatedValue: Value) -> GameResult
}

class Player: Resutable {
	let name: String
	let bet: Bet
	private(set) var gameState: GameState
	
	init(name: String, bet: Bet, deck: Deck) {
		self.name = name
		self.bet = bet
		
		let isBlackjack = deck.isBlackjack
		self.gameState = isBlackjack ? Blackjack(deck: deck) : Hit(deck: deck)
	}
	
	var canHit: Bool {
		gameState.isFinished == false
	}
	
	var state: PlayerState {
		PlayerState(name: name, gameState: gameState)
	}
	
	func gameResult(by calculatedValue: Winning) -> GameResult {
		PlayerGameResult(name: name, bet: bet, winning: calculatedValue, gameState: gameState)
	}

	func draw(card: BlackjackCard) {
		if gameState.isFinished == false {
			self.gameState = gameState.draw(card: card)
		}
	}
	
	func stay() {
		self.gameState = gameState.stay()
	}
}
