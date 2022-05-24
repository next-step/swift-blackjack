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
        let result = sut.totalPoint
        let expectation = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendCard() throws {
        // given
        var sut = Gamer(name: "naljin")
        
        // when
        let heart2 = Card(suit: .heart, denomination: .two)
        try sut.appendCard(heart2)
        
        // then
        let result = sut.cards
        let expectation = [heart2]
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendCard_카드의_총_합이_21을_넘으면_burt_에러를_throw한다() throws {
        // given
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        var sut = Gamer(name: "naljin")
        try sut.appendCard(heartJ)
        try sut.appendCard(heartQ)
        
        // when
        // then
        let heartK = Card(suit: .heart, denomination: .king)
        let expectation = Gamer.GamerError.burst
        XCTAssertThrowsError(try sut.appendCard(heartK)) { error in
            XCTAssertEqual(error as? Gamer.GamerError, expectation)
        }
    }
    
    func test_errorDescription_카드의_총_합이_21을_넘을때() throws {
        // given
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        var sut = Gamer(name: "naljin")
        try sut.appendCard(heartJ)
        try sut.appendCard(heartQ)
        
        // when
        // then
        let heartK = Card(suit: .heart, denomination: .king)
        XCTAssertThrowsError(try sut.appendCard(heartK)) { error in
            let result = (error as? Gamer.GamerError)?.localizedDescription
            let expectation = "총 합이 21을 초과했습니다"
            XCTAssertEqual(result, expectation)
        }
    }
}
