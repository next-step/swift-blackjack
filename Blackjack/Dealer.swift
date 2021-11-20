//
//  Dealer.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/13.
//

import Foundation

protocol CardDealable {
	func deal() throws-> BlackjackCard
}

final class Dealer: CardDealable {
	private(set) var deck: [BlackjackCard] = BlackjackCard.arrangeCards()
		
	func deal() throws -> BlackjackCard {
		guard self.deck.count > 0,
					let drawnCard = self.deck.randomElement()
		else { throw BlackjackError.noCard }
		
		self.deck.removeAll { card in
			card == drawnCard
		}
		return drawnCard
	}
}
