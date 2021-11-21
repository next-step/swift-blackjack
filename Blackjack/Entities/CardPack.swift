//
//  CardPack.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/21.
//

import Foundation

protocol CardDrawable {
	var cards: [BlackjackCard] { get set }
	mutating func draw() throws -> BlackjackCard
}

struct CardPack: CardDrawable {
	var cards: [BlackjackCard]
	
	mutating func draw() throws -> BlackjackCard {
		guard self.cards.count > 0,
					let drawnCard = self.cards.randomElement()
		else { throw BlackjackError.noCard }
		
		self.cards.removeAll { card in
			card == drawnCard
		}
		return drawnCard
	}
}

