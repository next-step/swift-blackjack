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
		let blackjackCards = dealear.firstDeal()
		XCTAssertEqual(blackjackCards.count, 2)
	}
	
	func test_shouldRemoveTheDrawnCardsWhenTheDealerDeals() throws {
		let dealer = Dealer()
		let initialDeckCount = dealer.deck.count
		
		let blackjackCards = dealer.firstDeal()
		let result = Set(dealer.deck + blackjackCards).count
		XCTAssertEqual(result, initialDeckCount)
	}
	
	func test_shouldOwnNameAnd2CardsWhenTheBlackjackGameStarts() {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)]
		let name = "ABC"
		let player = makeFixtureOfPlayer(name: name, deck: blackjackCards)
		
		XCTAssertEqual(player.name, name)
		XCTAssertEqual(player.deck, blackjackCards)
	}
	
	func test_shouldGetTheSumOfTheCardNumbersWhenAPlayerHits() {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)]
		let player = Player(name: "ABC", deck: blackjackCards)
		let sumOfTheCardNumbers = player.hit()
		let result = 9
		XCTAssertEqual(result, sumOfTheCardNumbers)
	}
	
	private func makeFixtureOfPlayer(name: String = "ABC", deck: [BlackjackCard] = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)]) -> Player {
		return Player(name: name, deck: deck)
	}
}
