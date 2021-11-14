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
		let blackjackCards = dealear.firstDeal()!
		XCTAssertEqual(blackjackCards.count, 2)
	}
	
	func test_shouldRemoveTheDrawnCardsWhenTheDealerDeals() throws {
		let dealer = Dealer()
		let initialDeckCount = dealer.deck.count
		
		let blackjackCards = dealer.firstDeal()!
		let result = Set(dealer.deck + blackjackCards).count
		XCTAssertEqual(result, initialDeckCount)
	}
	
	func test_shouldOwnNameAnd2CardsWhenTheBlackjackGameStarts() {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)]
		let name = "ABC"
		let player = Player(name: name, deck: blackjackCards)
		
		XCTAssertEqual(player.name, name)
		XCTAssertEqual(player.deck, blackjackCards)
	}
	
	func test_shouldGetOneCardWhenAPlayerHits() throws {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)]
		let player = Player(name: "ABC", deck: blackjackCards)
		let drawnCard = BlackjackCard(suit: .spades, rank: .two)
		
		try player.hit(drawnCard: drawnCard)
		let sumOfCardNumbers = player.deck.count
		XCTAssertEqual(3, sumOfCardNumbers)
	}
	
	func test_shouldThrowBustErrorWhenSumOfCardnumbersIsEqualToOrGreaterThanTheBlackjackNumber() throws {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .king), BlackjackCard(suit: .spades, rank: .eight)]
		let player = Player(name: "ABC", deck: blackjackCards)
		
		let firstDrawnCard = BlackjackCard(suit: .spades, rank: .three)
		try player.hit(drawnCard: firstDrawnCard)
		
		let secondDrawnCard = BlackjackCard(suit: .spades, rank: .two)
		
		XCTAssertThrowsError(try player.hit(drawnCard: secondDrawnCard)) { error in
			XCTAssertEqual(error as! BlackjackError, .bust)
		}
	}
	
	func test_shouldGetTheSumOfCardNumbersWhenTheGameIsOver() throws {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .clubs, rank: .ace)]
		let player = Player(name: "ABC", deck: blackjackCards)
		
		let firstDrawnCard = BlackjackCard(suit: .diamonds, rank: .ace)
		try player.hit(drawnCard: firstDrawnCard)
		
		let secondDrawnCard = BlackjackCard(suit: .diamonds, rank: .ace)
		try player.hit(drawnCard: secondDrawnCard)
		
		let thirdDrawnCard = BlackjackCard(suit: .diamonds, rank: .seven)
		try player.hit(drawnCard: thirdDrawnCard)
		
		let gameResult = player.gameIsOver()
		XCTAssertEqual(21, gameResult.sumOfCardNumbers)
	}
	
	func test_shouldGetGameResultWhenTheGameIsOver() {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .clubs, rank: .ace)]
		let player = Player(name: "ABC", deck: blackjackCards)
		let gameResult = player.gameIsOver()
		let expect = GameResult(name: "ABC", deck: blackjackCards, sumOfCardNumbers: 12)
		
		XCTAssertEqual(expect, gameResult)
	}
	
	func test_shouldHaveEachPlayers2CardsWhenGameStart() throws {
		let dealear = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealear, inputable: inputView)
		try blackjackGame.start()
		
		blackjackGame.players.forEach { player in
			XCTAssertEqual(player.deck.count, 2)
		}
	}
	
	func test_shouldGet1CardWhenPlayerAcceptsThe1Hit() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView)
		try blackjackGame.start()
		
		blackjackGame.players.forEach { player in
			XCTAssertEqual(player.deck.count, 3)
		}
	}
	
	func test_shouldThrowABustErrorWhenPlayerAcceptsThe7Hit() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y,y,y,y,y,y,y")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView)
		
		XCTAssertThrowsError(try blackjackGame.start()) { error in
			XCTAssertEqual(error as! BlackjackError, BlackjackError.bust)
		}
	}
	
}
