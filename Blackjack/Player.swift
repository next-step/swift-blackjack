//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

struct Player {
	let name: String
	private(set) var deck: [BlackjackCard]
	
	func hit() -> Int {
		deck.map { blackjackCard in
			blackjackCard.rank.value.first
		}.reduce(0) { partialResult, cardRank in
			partialResult + cardRank
		}
	}
}
