//
//  DealerGameResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/30.
//

import Foundation

struct DealerGameResult: GameResult {
	let name: String
	let bet: Bet
	let gameState: GameState
	let profit: Int
}
