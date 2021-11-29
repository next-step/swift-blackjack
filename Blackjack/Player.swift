//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

class Player {
	let name: String
	private let bet: Bet
	private var gameState: GameState
	
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
		PlayerState(name: name, bet: bet, gameState: gameState)
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
