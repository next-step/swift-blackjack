//
//  PlayerName.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/23.
//

import XCTest

class PlayerNameTest: XCTestCase {
    func test_콤마는_playername으로_가질수없다() {
        XCTAssertNil(PlayerName(","))
    }
}
