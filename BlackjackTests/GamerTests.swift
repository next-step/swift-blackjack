//
//  GamerTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class GamerTests: XCTestCase {
    
    func test_totalPoint_아무_카드도_없으면_0을_반환한다() throws {
        // given
        let sut = Gamer(name: "naljin")
        
        // when
        // then
        let result = sut.cards.totalPoint
        let expectation = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendCard() throws {
        // given
        let sut = Gamer(name: "naljin")
        
        // when
        let heart2 = Card(suit: .heart, denomination: .two)
        sut.appendCard(heart2)
        
        // then
        let result = sut.cards.cards
        let expectation = [heart2]
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendCard_카드의_총_합이_21을_넘은_상태이면_더_이상_카드를_추가하지_않는다() throws {
        // given
        let sut = Gamer(name: "naljin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        sut.appendCard(heartJ)
        sut.appendCard(heartQ)
        sut.appendCard(heartK)
        
        // when
        let heartA = Card(suit: .heart, denomination: .ace)
        sut.appendCard(heartA)
        
        // then
        let expectation = false
        let result = sut.cards.cards.contains(heartA)
        XCTAssertEqual(result, expectation)
    }
    
    func test_isBurst_카드의_총_합이_21을_넘지않으면_false를_리턴한다() throws {
        // given
        let sut = Gamer(name: "naljin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        
        // when
        sut.appendCard(heartJ)
        sut.appendCard(heartQ)
        
        // then
        let expectation = false
        let result = sut.cards.isBurst
        XCTAssertEqual(result, expectation)
    }
    
    func test_isBurst_카드의_총_합이_21을_넘으면_true를_리턴한다() throws {
        // given
        let sut = Gamer(name: "naljin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        
        // when
        sut.appendCard(heartJ)
        sut.appendCard(heartQ)
        sut.appendCard(heartK)
        
        // then
        let expectation = true
        let result = sut.cards.isBurst
        XCTAssertEqual(result, expectation)
    }
    
    func test_cardsDescription_쉼표로_카드를_구분하고_끗수와_슈트_순서로_카드를_표현한다() throws {
        // given
        let sut = Gamer(name: "naljin")
        let heart2 = Card(suit: .diamond, denomination: .two)
        let heartJ = Card(suit: .heart, denomination: .jack)
        
        //when
        sut.appendCard(heart2)
        sut.appendCard(heartJ)
        
        // then
        let expectation = "2다이아몬드, J하트"
        let result = sut.cards.description
        XCTAssertEqual(result, expectation)
    }
}
