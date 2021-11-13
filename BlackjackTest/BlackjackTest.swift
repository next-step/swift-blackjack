//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/13.
//

import XCTest

class BlackjackTest: XCTestCase {
    func test_shouldGet2CardsWhenTheDelearDealsCards() throws {
			let delear = Delear()
			let blackjackCards = delear.deal()
			XCTAssertEqual(blackjackCards.count, 2)
    }
}
