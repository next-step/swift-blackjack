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
	private(set) var cardPack: CardPack = BlackjackCard.arrangeCards()
	
	init() {
		guard let firstCard = try? cardPack.draw(),
					let secondCard = try? cardPack.draw()
		else { fatalError("처음 드로우되는 카드에서 noCard 에러가 발생했습니다.") }
		
		let deck = Deck(cards: [firstCard, secondCard])
		super.init(name: "딜러", deck: deck)
	}
		
	func deal() throws -> BlackjackCard {
		return try cardPack.draw()
	}
}

fileprivate extension Deck {
	
}
