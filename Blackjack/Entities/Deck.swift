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
	private(set) var cards: [BlackjackCard]
	
	var sumOfCardNumbers: Int {
		CardScoreCalculator.calculateTheSumOfCardNumbers(in: self)
	}
	
	var isBust: Bool {
		sumOfCardNumbers > BlackjackOption.blackjackNumber
	}
	
	var isBlackjack: Bool {
		sumOfCardNumbers == BlackjackOption.blackjackNumber
	}
	
	var hasAceCard: Bool {
		cards.filter { card in
			card.rank == .ace
		}.count > 0
	}
	
	var description: String {
		cards.map { $0.description }.joined(separator: ", ")
	}
	
	mutating func draw(of card: BlackjackCard) {
		self.cards.append(card)
	}
}
