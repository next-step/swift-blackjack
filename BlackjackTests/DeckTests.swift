//
//  DeckTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class DeckTests: XCTestCase {
    
    // MARK: - makeInitialCards
    
    func test_makeInitialCards() throws {
        // given
        let sut = Deck.self
        
        // when
        let result = sut.makeInitialCards().count
        
        // then
        let expectation = Denomination.allCases.count * Suit.allCases.count
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - removeFirst
    
    func test_removeFirst() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let sut = Deck(cards: [heart2])
        
        // when
        let result = sut.removeFirst()
        
        // then
        let expectation = heart2
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeFirst_카드가_비어있을때_nil을_반환한다() throws {
        // given
        let sut = Deck(cards: [])
        
        // when
        let result = sut.removeFirst()
        
        // then
        let expectation: Card? = nil
        XCTAssertEqual(result, expectation)
    }
}
