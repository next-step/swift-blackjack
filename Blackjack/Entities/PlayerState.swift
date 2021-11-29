//
//  PlayerState.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

struct PlayerState: Equatable {
	static func == (lhs: PlayerState, rhs: PlayerState) -> Bool {
		lhs.name == rhs.name
	}
	
	private let gameState: GameState
	let name: String
	let bet: Bet
	
	init(name: String, bet: Bet, gameState: GameState) {
		self.name = name
		self.bet = bet
		self.gameState = gameState
	}
		
	var deckDescription: String {
		gameState.deck.description
	}
	
	var sumOfCardNumbers: Int {
		gameState.deck.sumOfCardNumbers
	}
	
	var profit: Int {
		Int(gameState.profit(bet: bet))
	}
}
