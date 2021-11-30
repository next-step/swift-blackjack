//
//  PlayerGameResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/30.
//

import Foundation

struct PlayerGameResult: GameResult {
	let name: String
	let bet: Bet
	let winning: Winning
	let gameState: GameState
	
	var profit: Int {
		Int(gameState.profit(bet: bet, winning: winning))
	}
}
