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
        let 하트10 = Card(.heart, .ten)
        let 스페이드King = Card(.spade, .king)
        let cards = Cards([하트10, 스페이드King])
        
        // when
        let result = 20
        
        // then
        XCTAssertTrue(cards.result() == result)
    }
    
    func test_에이스_11로_계산되는지_검증() throws {
        // given
        let 하트Ace = Card(.heart, .ace)
        let 스페이드King = Card(.spade, .king)
        let cards = Cards([하트Ace, 스페이드King])
        
        // when
        let result = 21
        
        // then
        XCTAssertTrue(cards.result() == result)
    }
    
    func test_에이스_1로_계산되는지_검증() throws {
        // given
        let 하트Ace = Card(.heart, .ace)
        let 스페이드Ten = Card(.spade, .ten)
        let 다이아Jack = Card(.diamond, .jack)
        let cards = Cards([하트Ace, 스페이드Ten, 다이아Jack])
        
        // when
        let result = 21
        
        // then
        XCTAssertTrue(cards.result() == result)
    }
    
    func test_플레이어_카드분배_검증() {
        // given
        let deck: Deck = Deck()
        let player1 = Player(name: "player1")
        let player2 = Player(name: "player2")
        let players = Players([player1, player2])
        
        // when/then
        XCTAssertNoThrow(try players.handoutAllPlayers(deck: deck))
    }
    
    func test_플레이어_커스텀_맵_검증() {
        let player1 = Player(name: "player1")
        let player2 = Player(name: "player2")
        let players = Players([player1, player2])
        
        // when
        let result: [String] = ["player1", "player2"]
        
        XCTAssertTrue(result == players.customMap { $0.name })
    }
    
    func test_플레이어_커스텀_필터_검증() {
        let player1 = Player(name: "player1")
        let player2 = Player(name: "player2")
        let players = Players([player1, player2])
        
        // when
        let filter = "player1"
        let result = 1
        
        XCTAssertTrue(result == players.customFilter { $0.name == filter }.count)
    }
}
