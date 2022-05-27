//
//  BlackjackGaemJudgeTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

extension WinLoseResult: Equatable {
    static func == (lhs: WinLoseResult, rhs: WinLoseResult) -> Bool {
        return lhs.player.name == rhs.player.name
        && lhs.loseCount == rhs.loseCount
        && rhs.winCount == rhs.winCount
    }
}

class BlackjackGameJudgeTest: XCTestCase {
    func test_winLoseResultScores_게임참가자들의_게임점수를_가지고_실패결과에_해당하는_WinLoseResults를_반환한다() {
        // given
        let gameJudge = BlackjackGameJudge()
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let playerOne = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let playerTwo = Player(name: PlayerName("lee")!, cardDeck: BlackjackCardDeck())
        
        let dealerScore = BlackjackScore(player: dealer, score: 21)
        let playerOneScore = BlackjackScore(player: playerOne, score: 21)
        let playerTwoScore = BlackjackScore(player: playerTwo, score: 20)
        
        let dealerResult = WinLoseResult(player: dealer, winCount: 1, loseCount: 1)
        let playerOneResult = WinLoseResult(player: playerOne, winCount: 1, loseCount: 0)!
        let playerTwoResult = WinLoseResult(player: playerTwo, winCount: 0, loseCount: 1)!
        
        // when
        let winLoseResults = gameJudge.winLoseResults(of: [playerOneScore, playerTwoScore], comparingWith: dealerScore)
        
        // then
        
        XCTAssertEqual(winLoseResults.standardResult, dealerResult)
        XCTAssertTrue(winLoseResults.playerResults.contains(playerOneResult))
        XCTAssertTrue(winLoseResults.playerResults.contains(playerTwoResult))
    }
    
    func test_winLoseResultScores_승패계산의_기준이되는_점수거_21을_넘을경우_나머지_참가자들이_무조건_이긴것으로_취급한다() {
        // given
        let gameJudge = BlackjackGameJudge()
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        
        let dealerScore = BlackjackScore(player: dealer, score: 22)
        let playerScore = BlackjackScore(player: player, score: 21)
        
        let dealerResult = WinLoseResult(player: dealer, winCount: 0, loseCount: 1)
        let playerResult = WinLoseResult(player: player, winCount: 1, loseCount: 0)
        
        // when
        let winLoseResults = gameJudge.winLoseResults(of: [playerScore], comparingWith: dealerScore)
        
        // then
        XCTAssertEqual(winLoseResults.standardResult, dealerResult)
        XCTAssertTrue(winLoseResults.playerResults.contains(playerResult!))
    }
}
