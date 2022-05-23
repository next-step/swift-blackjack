//
//  BlackjackTests.swift
//  BlackjackTests
//
//  Created by ycsong on 2022/05/22.
//

import XCTest

class BlackjackTests: XCTestCase {
    func test_덱의_카드수가_52장인지_검증() throws {
        // given
        let deck: Deck = Deck()
        
        // when
        let deckCount: Int = 52
        
        // then
        XCTAssertTrue(deckCount == deck.count)
    }
}
