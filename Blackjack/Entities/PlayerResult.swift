//
//  WinningResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/21.
//

import Foundation

struct PlayerResult {
	enum Winning: String {
		case win = "승"
		case push = "무"
		case lose = "패"
	}
	let name: String
	let winning: Winning
	
	var description: String {
		"\(name): \(winning.rawValue)"
	}
}

