//
//  PlayerName.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/23.
//

import XCTest

class PlayerNameTest: XCTestCase {
    func test_콤마를_이용하여_PlayerName을_생성하면_nil을_반환한다() {
        XCTAssertNil(PlayerName(","))
    }
}
