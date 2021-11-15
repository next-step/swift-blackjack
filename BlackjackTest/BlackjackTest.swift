//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/13.
//

import XCTest

class BlackjackTest: XCTestCase {
	let resultView = StubResultView()
	
	override func tearDownWithError() throws {
		StubInputView.Verify.clear()
		resultView.clear()
	}
	
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
		
		let gameResult = player.gameResult
		XCTAssertEqual(21, gameResult.sumOfCardNumbers)
	}
	
	func test_shouldGetGameResultWhenTheGameIsOver() {
		let blackjackCards = [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .clubs, rank: .ace)]
		let player = Player(name: "ABC", deck: blackjackCards)
		let gameResult = player.gameResult
		let expect = GameResult(name: "ABC", deck: blackjackCards, sumOfCardNumbers: 12)
		
		XCTAssertEqual(expect, gameResult)
	}
	
	func test_shouldHaveEachPlayers2CardsWhenGameStart() throws {
		let dealear = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealear, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		
		blackjackGame.players.forEach { player in
			XCTAssertEqual(player.deck.count, 2)
		}
	}
	
	func test_shouldGet1CardWhenPlayerAcceptsThe1Hit() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		
		blackjackGame.players.forEach { player in
			XCTAssertEqual(player.deck.count, 3)
		}
	}
	
	func test_shouldThrowABustErrorWhenPlayerAcceptsThe7Hit() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y","y","y","y","y","y","y")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		
		XCTAssertThrowsError(try blackjackGame.start()) { error in
			XCTAssertEqual(error as! BlackjackError, BlackjackError.bust)
		}
	}
	
	func test_shouldGetGameResultsWhenGameIsOver() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def,ghi", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		
		let expectNames = ["abc", "def", "ghi"]
		
		XCTAssertTrue(resultView.gameResults.count == 3)
		XCTAssertEqual(resultView.gameResults.map { $0.name }, expectNames)
	}
	
	func test_shouldTheDealWithANextPlayerWhenAPlayerDoNotHit() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		
		let expectMoveOnToTheNextPlayerCoount = 1
		let expectAnswerTheHitIndex = 1
		
		XCTAssertEqual(StubInputView.Verify.moveOnToTheNextPlayerCount, expectMoveOnToTheNextPlayerCoount)
		XCTAssertEqual(inputView.answerTheHitIndex, expectAnswerTheHitIndex)
	}
	
	func test_shouldHitAgainWhenAPlayerHit() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y","n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		
		let expectMoveOnToTheNextPlayerCoount = 1
		let expectAnswerTheHitIndex = 2
		
		XCTAssertEqual(StubInputView.Verify.moveOnToTheNextPlayerCount, expectMoveOnToTheNextPlayerCoount)
		XCTAssertEqual(inputView.answerTheHitIndex, expectAnswerTheHitIndex)
	}
	
	func test_shouldThrowEmptyErrorWhenInputNameIsEmpty() throws {
		try testExpectInputError(expect: BlackjackError.InputError.empty, playerName: nil, answerTheHit: "n")
		try testExpectInputError(expect: BlackjackError.InputError.empty, playerName: "", answerTheHit: "n")
		try testExpectInputError(expect: BlackjackError.InputError.empty, playerName: "a,b", answerTheHit: nil)
		try testExpectInputError(expect: BlackjackError.InputError.empty, playerName: "a,b", answerTheHit: "")
	}
	
	func test_shouldThrowDuplicateErrorWhenInputNameIsDuplicated() throws {
		try testExpectInputError(expect: BlackjackError.InputError.duplicatedName, playerName: "abc,def,abc", answerTheHit: "n")
		try testExpectInputError(expect: BlackjackError.InputError.duplicatedName, playerName: "abc,dabc,def,abc", answerTheHit: "n")
	}
	
	func test_shouldThrowAnOutOfRangesForNumberOfParticipantsErrorWhenInputNameIsNotContainedInNumberOfParticipantsRange() throws {
		try testExpectInputError(expect: BlackjackError.InputError.outOfRangesForNumberOfParticipants, playerName: "abc", answerTheHit: "n")
		try testExpectInputError(expect: BlackjackError.InputError.outOfRangesForNumberOfParticipants, playerName: "abc,def,123,456,789,1011", answerTheHit: "n")
	}
	
	func test_shouldThrowAnOutOfRangesInNameErrorWhenInputNameIsNotContainedInNumberOfNamesRange() throws {
		try testExpectInputError(expect: BlackjackError.InputError.outOfRangeInName, playerName: "abcdefghijasdfkjwbefjkbwa, abcd", answerTheHit: "n")
		try testExpectInputError(expect: BlackjackError.InputError.outOfRangeInName, playerName: "12345678910, abcde", answerTheHit: "n")
	}
	
	func test_shouldThrowAnOutOfRangesInYesOrNoErrorWhenInputIsOtherThanYesOrNo() throws {
		try testExpectInputError(expect: BlackjackError.InputError.outOfRangeInYesOrNo, playerName: "abcde, abcd", answerTheHit: "a")
		try testExpectInputError(expect: BlackjackError.InputError.outOfRangeInYesOrNo, playerName: "12345678, abcde", answerTheHit: "1")
	}
	
	func test_shouldOutputGameStatusBeforePlayWhenAfterTheDeals() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab,cd,ef", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutGameStatusBeforePlay, true)
	}
	
	func test_shouldOutputAllCardsWhenPlayerHits() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab,cd,ef", answerTheHit: "y", "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutDeckOfPlayer, true)
		XCTAssertEqual(resultView.hitCount, [1, 1, 1])
	}
	
	func test_shouldOutputGameResultWhenGameIsOver() throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab,cd,ef", answerTheHit: "y", "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		try blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutGameResult, true)
	}
	
	private func testExpectInputError(expect expectedError: BlackjackError.InputError, playerName: String?, answerTheHit: String? ...)  throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: playerName, answerTheHit: answerTheHit)
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		
		XCTAssertThrowsError(try blackjackGame.start()) { error in
			XCTAssertEqual(error as! BlackjackError.InputError, expectedError)
		}
	}
}
