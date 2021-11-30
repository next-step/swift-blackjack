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

final class Dealer: Player, CardDealable {
	private(set) var cardPack: CardDrawable
	
	init(cardPack: CardDrawable) {
		self.cardPack = cardPack
		guard let firstCard = try? self.cardPack.draw(),
					let secondCard = try? self.cardPack.draw()
		else { fatalError("처음 드로우되는 카드에서 noCard 에러가 발생했습니다.") }
		
		let deck = Deck(cards: [firstCard, secondCard])
		super.init(name: "딜러", bet: DealerBet(), deck: deck)
	}
	
	override var canHit: Bool {
		state.sumOfCardNumbers <= BlackjackOption.dealerLimitNumber
	}
		
	func deal() throws -> BlackjackCard {
		return try cardPack.draw()
	}
	
	func gameResult(by calculatedValue: Int) -> GameResult {
		DealerGameResult(name: name, bet: bet, gameState: gameState, profit: calculatedValue)
	}
}
