//
//  Dealer.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/13.
//

import Foundation

final class Dealer {
	private(set) var deck: [BlackjackCard] = BlackjackCard.arrangeCards()
	
	func deal() -> [BlackjackCard] {
		self.drawCard(of: 2)
	}
	
	private func drawCard(of numberOfCards: Int) -> [BlackjackCard] {
		(0...numberOfCards).map { _ in
			self.deck.removeLast()
		}
	}
}
