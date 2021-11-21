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
		let dealer = Dealer()
		let blackjackCards = [try dealer.deal(), try dealer.deal()]
		XCTAssertEqual(blackjackCards.count, 2)
	}
	
	func test_shouldRemoveTheDrawnCardsWhenTheDealerDeals() throws {
		let dealer = Dealer()
		let initialDeckCount = dealer.cardPack.cards.count
		
		let blackjackCards = [try dealer.deal(), try dealer.deal()]
		let result = Set(dealer.cardPack.cards + blackjackCards).count
		XCTAssertEqual(result, initialDeckCount)
	}
	
	func test_shouldOwnNameAnd2CardsWhenTheBlackjackGameStarts() {
		let blackjackCards = Deck(cards: [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)])
		let name = "ABC"
		let player = Player(name: name, deck: blackjackCards)
		
		XCTAssertEqual(player.name, name)
		XCTAssertEqual(player.deck, blackjackCards)
	}
	
	func test_shouldGetOneCardWhenAPlayerHits() throws {
		let blackjackCards = Deck(cards: [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .spades, rank: .eight)])
		let player = Player(name: "ABC", deck: blackjackCards)
		let drawnCard = BlackjackCard(suit: .spades, rank: .two)
		
		try player.hit(drawnCard: drawnCard)
		let sumOfCardNumbers = player.deck.cards.count
		XCTAssertEqual(3, sumOfCardNumbers)
	}
	
	func test_shouldThrowBustErrorWhenSumOfCardnumbersIsEqualToOrGreaterThanTheBlackjackNumber() throws {
		let blackjackCards = Deck(cards: [BlackjackCard(suit: .spades, rank: .king), BlackjackCard(suit: .spades, rank: .eight)])
		let player = Player(name: "ABC", deck: blackjackCards)
		
		let firstDrawnCard = BlackjackCard(suit: .spades, rank: .three)
		try player.hit(drawnCard: firstDrawnCard)
		
		let secondDrawnCard = BlackjackCard(suit: .spades, rank: .two)
		
		XCTAssertThrowsError(try player.hit(drawnCard: secondDrawnCard)) { error in
			XCTAssertEqual(error as! BlackjackError, .bust)
		}

	}
	
	func test_shouldGetTheSumOfCardNumbersWhenTheGameIsOver() throws {
		let blackjackCards = Deck(cards: [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .clubs, rank: .ace)])
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
		let blackjackCards = Deck(cards: [BlackjackCard(suit: .spades, rank: .ace), BlackjackCard(suit: .clubs, rank: .ace)])
		let player = Player(name: "ABC", deck: blackjackCards)
		let gameResult = player.gameResult
		let expect = GameResult(name: "ABC", deck: blackjackCards, sumOfCardNumbers: 12)
		
		XCTAssertEqual(expect, gameResult)
	}
	
	func test_shouldHaveEachPlayers2CardsWhenGameStart() {
		let dealear = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealear, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		blackjackGame.players.forEach { player in
			XCTAssertEqual(player.deck.cards.count, 2)
		}
	}
	
	func test_shouldGet1CardWhenPlayerAcceptsThe1Hit() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		blackjackGame.players.forEach { player in
			XCTAssertEqual(player.deck.cards.count, 3)
		}
	}
	
	func test_shouldThrowABustErrorWhenPlayerAcceptsThe7Hit() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y","y","y","y","y","y","y")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		XCTAssertEqual(StubResultView.Verify.printOutError, true)
		XCTAssertEqual(resultView.error, .bust)
	}
	
	func test_shouldGetGameResultsWhenGameIsOver() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def,ghi", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		let expectNames = ["abc", "def", "ghi"]
		
		XCTAssertTrue(resultView.gameResults.count == 3)
		XCTAssertEqual(resultView.gameResults.map { $0.name }, expectNames)
	}
	
	func test_shouldTheDealWithANextPlayerWhenAPlayerDoNotHit() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		let expectMoveOnToTheNextPlayerCoount = 1
		let expectAnswerTheHitIndex = 1
		
		XCTAssertEqual(StubInputView.Verify.moveOnToTheNextPlayerCount, expectMoveOnToTheNextPlayerCoount)
		XCTAssertEqual(inputView.answerTheHitIndex, expectAnswerTheHitIndex)
	}
	
	func test_shouldHitAgainWhenAPlayerHit() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "abc,def", answerTheHit: "y","n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		let expectMoveOnToTheNextPlayerCoount = 1
		let expectAnswerTheHitIndex = 2
		
		XCTAssertEqual(StubInputView.Verify.moveOnToTheNextPlayerCount, expectMoveOnToTheNextPlayerCoount)
		XCTAssertEqual(inputView.answerTheHitIndex, expectAnswerTheHitIndex)
	}
	
	func test_shouldThrowEmptyErrorWhenInputNameIsEmpty() throws {
		try testExpectInputError(expect: .input(.empty), playerName: nil, answerTheHit: "n")
		try testExpectInputError(expect: .input(.empty), playerName: "", answerTheHit: "n")
		try testExpectInputError(expect: .input(.empty), playerName: "a,b", answerTheHit: nil)
		try testExpectInputError(expect: .input(.empty), playerName: "a,b", answerTheHit: "")
	}
	
	func test_shouldThrowDuplicateErrorWhenInputNameIsDuplicated() throws {
		try testExpectInputError(expect: .input(.duplicatedName), playerName: "abc,def,abc", answerTheHit: "n")
		try testExpectInputError(expect: .input(.duplicatedName), playerName: "abc,dabc,def,abc", answerTheHit: "n")
	}
	
	func test_shouldThrowAnOutOfRangesForNumberOfParticipantsErrorWhenInputNameIsNotContainedInNumberOfParticipantsRange() throws {
		try testExpectInputError(expect: .input(.outOfRangesForNumberOfParticipants), playerName: "abc", answerTheHit: "n")
		try testExpectInputError(expect: .input(.outOfRangesForNumberOfParticipants), playerName: "abc,def,123,456,789,1011", answerTheHit: "n")
	}
	
	func test_shouldThrowAnOutOfRangesInNameErrorWhenInputNameIsNotContainedInNumberOfPlayers() throws {
		try testExpectInputError(expect: .input(.outOfRangeInName), playerName: "abcdefghijasdfkjwbefjkbwa, abcd", answerTheHit: "n")
		try testExpectInputError(expect: .input(.outOfRangeInName), playerName: "12345678910, abcde", answerTheHit: "n")
	}
	
	func test_shouldThrowAnOutOfRangesInYesOrNoErrorWhenInputIsOtherThanYesOrNo() throws {
		try testExpectInputError(expect: .input(.outOfRangeInYesOrNo), playerName: "abcde, abcd", answerTheHit: "a")
		try testExpectInputError(expect: .input(.outOfRangeInYesOrNo), playerName: "12345678, abcde", answerTheHit: "1")
	}
	
	func test_shouldOutputGameStatusBeforePlayWhenAfterTheDeals() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab,cd,ef", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutGameStatusBeforePlay, true)
	}
	
	func test_shouldOutputAllCardsWhenPlayerHits() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab,cd,ef", answerTheHit: "y", "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutDeckOfPlayer, true)
		XCTAssertEqual(resultView.hitCount, [1, 1, 1])
	}
	
	func test_shouldOutputGameResultWhenGameIsOver() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab,cd,ef", answerTheHit: "y", "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutGameResult, true)
	}
	
	func test_shouldOutputEmptyErrorMessageWhenThrowsEmptyError() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: nil, answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		
		blackjackGame.start()
		XCTAssertEqual(StubResultView.Verify.printOutError, true)
		XCTAssertEqual(resultView.error, .input(.empty))
	}
	
	func test_shouldTheDealerTakeCardsWhenGameStart() {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: "ab, bc", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		
		blackjackGame.start()
		XCTAssertFalse(dealer.cardPack.cards.isEmpty)
	}
	
	func test_shouldTakeOneMoreCardWhenTheScoreOfDealerIs16OrLess() {
		let blackjackCards = (1...9).map { BlackjackCard(suit: .clubs, rank: BlackjackCard.Rank(rawValue: $0)!) }
		let cardPack: CardDrawable = StubCardPack(cards: blackjackCards)
		let dealer = Dealer(cardPack: cardPack)
		let inputView = StubInputView(playerNames: "ab, bc", answerTheHit: "n")
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		
		blackjackGame.start()
		XCTAssertTrue(dealer.cardPack.cards.count == 3)
	}
	
	private func testExpectInputError(expect expectedError: BlackjackError, playerName: String?, answerTheHit: String? ...)  throws {
		let dealer = Dealer()
		let inputView = StubInputView(playerNames: playerName, answerTheHit: answerTheHit)
		let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
		blackjackGame.start()
		
		XCTAssertEqual(StubResultView.Verify.printOutError, true)
		XCTAssertEqual(resultView.error, expectedError)
		
		resultView.clear()
	}
}
