//
//  GameResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

struct GameResult: Equatable {
	let name: String
	let deck: [BlackjackCard]
	let sumOfCardNumbers: Int
}
