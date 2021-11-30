//
//  PlayResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

protocol GameResult {
	var name: String { get }
	var bet: Bet { get }
	var gameState: GameState { get }
	var profit: Int { get }
}
