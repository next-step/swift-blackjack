//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/13.
//

import XCTest

class BlackjackTest: XCTestCase {
	func test_shouldGet2CardsWhenTheDealerDealsCards() throws {
		let dealear = Dealer()
		let blackjackCards = dealear.deal()
		XCTAssertEqual(blackjackCards.count, 2)
	}
	
	func test_shouldRemoveTheDrawnCardsWhenTheDealerDeals() throws {
		let dealer = Dealer()
		let initialDeckCount = dealer.deck.count
		
		let blackjackCards = dealer.deal()
		let result = Set(dealer.deck + blackjackCards).count
		XCTAssertEqual(result, initialDeckCount)
	}
}
