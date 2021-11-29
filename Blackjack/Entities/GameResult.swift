//
//  PlayResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

struct GameResult {
	let name: String
	let bet: Bet
	let winning: Winning
	let gameState: GameState
	
	var profit: Int {
		Int(gameState.profit(bet: bet, winning: winning))
	}
}
