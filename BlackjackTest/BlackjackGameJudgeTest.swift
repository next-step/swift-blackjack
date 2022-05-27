//
//  BlackjackGaemJudgeTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class BlackjackGameJudgeTest: XCTestCase {
    func test_judge_여러BlackjackScore를_가지고_WinLoseResult를_반환한다() {
        // given
        let gameJudge = BlackjackGameJudge()
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        
        let dealerScore = BlackjackScore(player: dealer, score: 21)
        let playerScore = BlackjackScore(player: player, score: 21)
        
        // when
        let winLoseResult = gameJudge.winLoseResult(of: playerScore, comparingWith: dealerScore)
        
        // then
        XCTAssertEqual(winLoseResult.winCount, 1)
    }
    
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
        let playerOneResult = WinLoseResult(player: playerOne, winCount: 1, loseCount: 0)
        let playerTwoResult = WinLoseResult(player: playerTwo, winCount: 0, loseCount: 1)
            // when
        let winLoseResults = gameJudge.winLoseResults(with: [playerOneScore, playerTwoScore], comparingWith: dealerScore)
        
        // then
        XCTAssertEqual(winLoseResults[dealer], dealerResult)
        XCTAssertEqual(winLoseResults[playerOne], playerOneResult)
        XCTAssertEqual(winLoseResults[playerTwo], playerTwoResult)
    }
}
