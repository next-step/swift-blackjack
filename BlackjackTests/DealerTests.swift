//
//  DealerTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class DealerTests: XCTestCase {
    
    func test_drawCard() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let deck = Deck(cards: [heart2])
        let sut = Dealer(deck: deck)
        
        // when
        let result = try sut.drawCard()
        
        // then
        let expectation = heart2
        XCTAssertEqual(result, expectation)
    }
    
    func test_drawCard_카드가_비어있을때_noCards_에러를_throw한다() throws {
        // given
        let deck = Deck(cards: [])
        let sut = Dealer(deck: deck)
        
        // when
        // then
        let expectation = Dealer.DealerError.noCards
        XCTAssertThrowsError(try sut.drawCard()) { error in
            XCTAssertEqual(error as? Dealer.DealerError, expectation)
        }
    }
    
    func test_isNeedToGetMoreCard_보유한_카드의_합이_16_이하이면_true를_반환한다() throws {
        // given
        let deck = Deck(cards: [])
        let sut = Dealer(deck: deck)
        let heart2 = Card(suit: .heart, denomination: .two)
        let heart3 = Card(suit: .heart, denomination: .three)
        sut.appendCard(heart2)
        sut.appendCard(heart3)
        
        // when
        let result = sut.isNeedToGetMoreCard
        
        // then
        let expectation = true
        XCTAssertEqual(result, expectation)
    }
    
    func test_isNeedToGetMoreCard_보유한_카드의_합이_16_초과이면_false를_반환한다() throws {
        // given
        let deck = Deck(cards: [])
        let sut = Dealer(deck: deck)
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        sut.appendCard(heartJ)
        sut.appendCard(heartQ)
        
        // when
        let result = sut.isNeedToGetMoreCard
        
        // then
        let expectation = false
        XCTAssertEqual(result, expectation)
    }
    
    func test_errorDescription_카드가_비어있을때() throws {
        // given
        let deck = Deck(cards: [])
        let sut = Dealer(deck: deck)
        
        // when
        // then
        XCTAssertThrowsError(try sut.drawCard()) { error in
            let result = (error as? Dealer.DealerError)?.localizedDescription
            let expectation = "더 이상 뽑을 카드가 없습니다"
            XCTAssertEqual(result, expectation)
        }
    }
}
