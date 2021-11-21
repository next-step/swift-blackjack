//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

class Player {
	let name: String
	private(set) var deck: Deck
	var gameResult: GameResult {
		GameResult(name: name, deck: deck, sumOfCardNumbers: CardScoreCalculator.calculateTheSumOfCardNumbers(in: deck))
	}
	
	init(name: String, deck: Deck) {
		self.name = name
		self.deck = deck
	}
	
	func hit(drawnCard: BlackjackCard) throws {
		guard isAvailableHit() else { throw BlackjackError.bust }
		deck.draw(of: drawnCard)
	}
	
	private func isAvailableHit() -> Bool {
		let sumOfCardNumbers = CardScoreCalculator.calculateWithFirstValue(in: deck)
		return sumOfCardNumbers < BlackjackOption.blackjackNumber
	}
}
