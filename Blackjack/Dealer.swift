//
//  Dealer.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/13.
//

import Foundation

struct Dealer {
	func deal() -> [BlackjackCard] {
		return [
			BlackjackCard(suit: .spades, rank: .ace),
			BlackjackCard(suit: .spades, rank: .two)
		]
	}
}
