//
//  Deck.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/21.
//

import Foundation

struct Deck: Equatable {
	static func == (lhs: Deck, rhs: Deck) -> Bool {
		lhs.cards == rhs.cards
	}
	
	var cards: [BlackjackCard]
	
	mutating func draw(of card: BlackjackCard) {
		self.cards.append(card)
	}
}
