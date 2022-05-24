//
//  BlackjackTests.swift
//  BlackjackTests
//
//  Created by ycsong on 2022/05/22.
//

import XCTest

class BlackjackTests: XCTestCase {
    func test_덱_카드수_52장인지_검증() throws {
        // given
        let deck: Deck = Deck()
        
        // when
        let deckCount: Int = 52
        
        // then
        XCTAssertTrue(deckCount == deck.count)
    }
    
    func test_덱이_0장_일때_드로우_검증() throws {
        // given
        let deck: Deck = Deck()
        
        // when
        for _ in 0..<deck.count {
            _ = try deck.drawCard()
        }
        
        // then
        XCTAssertThrowsError(try deck.drawCard())
    }
    
    func test_덱이_0장_이상_일때_드로우_검증() throws {
        // given
        let deck: Deck = Deck()
        
        // when/then
        XCTAssertNoThrow(try deck.drawCard())
    }
    
    func test_에이스_없는_게임_결과_검증() throws {
        // given
        let 하트10 = Card(.하트, .ten)
        let 스페이드King = Card(.스페이드, .king)
        let cards = Cards([하트10, 스페이드King])
        
        // when
        let result = 20
        
        // then
        XCTAssertTrue(cards.result() == result)
    }
    
    func test_에이스_11로_계산되는지_검증() throws {
        // given
        let 하트Ace = Card(.하트, .ace)
        let 스페이드King = Card(.스페이드, .king)
        let cards = Cards([하트Ace, 스페이드King])
        
        // when
        let result = 21
        
        // then
        XCTAssertTrue(cards.result() == result)
    }
    
    func test_에이스_1로_계산되는지_검증() throws {
        // given
        let 하트Ace = Card(.하트, .ace)
        let 스페이드Ten = Card(.스페이드, .ten)
        let 다이아Jack = Card(.다이아, .jack)
        let cards = Cards([하트Ace, 스페이드Ten, 다이아Jack])
        
        // when
        let result = 21
        
        // then
        XCTAssertTrue(cards.result() == result)
    }
}
