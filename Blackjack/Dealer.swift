//
//  Dealer.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/13.
//

import Foundation

final class Dealer {
	private(set) var deck: [BlackjackCard] = BlackjackCard.arrangeCards()
	
	func firstDeal() -> [BlackjackCard] {
		return [deal(), deal()]
	}
	
	func deal() -> BlackjackCard {
		return self.deck.removeLast()
	}
}
