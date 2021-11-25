//
//  WinningResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/21.
//

import Foundation

struct PlayerResult {
	let name: String
	let winning: Winning
	
	var description: String {
		"\(name): \(winning.description)"
	}
}

