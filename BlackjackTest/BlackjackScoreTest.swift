//
//  BlackjackScoreTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class BlackjackScoreTest: XCTestCase {

    func test_BlackjackScore_isBigger_특정숫자보다_보유한점수가_더크면_true를_반환한다() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let blackjackScore = BlackjackScore(player: player, score: 20)
        
        // when
        let result = blackjackScore.isBigger(than: 19)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_BlackjackScore_isBigger_특정숫자보다_보유한점수가_더작으면_false를_반환한다() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let blackjackScore = BlackjackScore(player: player, score: 20)
        
        // when
        let result = blackjackScore.isBigger(than: 21)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_BlackjackScores_playerScores_딜러를_제외한_참가자들의_점수배열만_반환한다() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        
        let playerScore = BlackjackScore(player: player, score: 20)
        let dealerScore = BlackjackScore(player: dealer, score: 20)
        let blackjackScores = BlackjackScores([playerScore, dealerScore])
        
        // when
        // then
        print(blackjackScores.playerScores)
        XCTAssertFalse(blackjackScores.playerScores.contains(dealerScore))
        XCTAssertTrue(blackjackScores.playerScores.contains(playerScore))
    }
}
