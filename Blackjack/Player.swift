//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

class Player {
	let name: String
	var deck: Deck
	var cardResultScore: CardResultScore {
		CardResultScore(name: name, deck: deck, sumOfCardNumbers: CardScoreCalculator.calculateTheSumOfCardNumbers(in: deck))
	}
	
	init(name: String, deck: Deck) {
		self.name = name
		self.deck = deck
	}
	
	func hit(drawnCard: BlackjackCard) {
		if canHit() {
			deck.draw(of: drawnCard)
		}
	}
	
	func canHit() -> Bool {
		let sumOfCardNumbers = CardScoreCalculator.calculateWithFirstValue(in: deck)
		return sumOfCardNumbers < BlackjackOption.blackjackNumber
	}
}
