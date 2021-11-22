//
//  WinningResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/21.
//

import Foundation

struct PlayerResult {
	enum Winning {
		case win, draw, lose
	}
	let name: String
	let winning: Winning
}

