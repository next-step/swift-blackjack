//
//  WinLoseResultTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/26.
//

import XCTest

class WinLoseResultTest: XCTestCase {

    func test_WinLoseResult는_winCount로_양수만_갖는다() {
        // given
        let player = Player(name: PlayerName("player")!, cardDeck: BlackjackCardDeck())
        
        // when
        // then
        XCTAssertNil(WinLoseResult(player: player, winCount: -1, loseCount: 0))
    }
    
    func test_WinLoseResult는_loseCount로_양수만_갖는다() {
        // given
        let player = Player(name: PlayerName("player")!, cardDeck: BlackjackCardDeck())
        
        // when
        // then
        XCTAssertNil(WinLoseResult(player: player, winCount: 0, loseCount: -1))
    }
}
