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
        XCTAssertEqual(winLoseResult.winCount, 1)
    }
}
