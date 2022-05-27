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
    
    func test_WinLoseResults는_특정_player의_WinLoseResult를_반환한다() {
        // given
        let player = Player(name: PlayerName("player")!, cardDeck: BlackjackCardDeck())
        let winLoseResult = WinLoseResult(player: player, winCount: 0, loseCount: 1)!
        let winLoseResults = WinLoseResults(value:  [winLoseResult])
        

        // when
        let result = winLoseResults[player]
        
        // then
        XCTAssertEqual(result?.player, winLoseResult.player)
        XCTAssertEqual(result?.winCount, winLoseResult.winCount)
        XCTAssertEqual(result?.loseCount, winLoseResult.loseCount)
    }
}
