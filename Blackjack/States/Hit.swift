//
//  Hit.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/29.
//

import Foundation

class Hit: Running {
	var deck: Deck
	
	required init(deck: Deck) {
		self.deck = deck
	}

	func draw(card: BlackjackCard) -> GameState {
		deck.draw(of: card)
		if deck.isBust { return Bust(deck: deck) }
		if deck.isBlackjack { return Blackjack(deck: deck) }
		return Hit(deck: deck)
	}
	
	func stay() -> GameState {
		return Stay(deck: deck)
	}
}
