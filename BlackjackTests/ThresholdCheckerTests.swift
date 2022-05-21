//
//  ThresholdCheckerTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class ThresholdCheckerTests: XCTestCase {

    var sut: ThresholdChecker!
    
    override func setUpWithError() throws {
        sut = ThresholdChecker()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isTotalPointUnderThreshold_2_3_K_카드를_가지면_true를_반환한다() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let heart3 = Card(suit: .heart, denomination: .three)
        let heartK = Card(suit: .heart, denomination: .king)
        let cards: [Card] = [heart2, heart3, heartK]
        
        // when
        let result = sut.isTotalPointUnderThreshold(of: cards)
        
        // then
        let expectation = true
        XCTAssertEqual(result, expectation)
    }
    
    func test_isTotalPointUnderThreshold_J_Q_K_카드를_가지면_false를_반환한다() throws {
        // given
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        let cards: [Card] = [heartJ, heartQ, heartK]
        
        // when
        let result = sut.isTotalPointUnderThreshold(of: cards)
        
        // then
        let expectation = false
        XCTAssertEqual(result, expectation)
    }
    
    func test_isTotalPointUnderThreshold_2_3_A_카드를_가지면_true를_반환한다() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let heart3 = Card(suit: .heart, denomination: .three)
        let heartA = Card(suit: .heart, denomination: .ace)
        let cards: [Card] = [heart2, heart3, heartA]
        
        // when
        let result = sut.isTotalPointUnderThreshold(of: cards)
        
        // then
        let expectation = true
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_5_6_A_카드를_가지면_true를_반환한다() throws {
        // given
        let heart5 = Card(suit: .heart, denomination: .five)
        let heart6 = Card(suit: .heart, denomination: .six)
        let heartA = Card(suit: .heart, denomination: .ace)
        let cards: [Card] = [heart5, heart6, heartA]
        
        // when
        let result = sut.isTotalPointUnderThreshold(of: cards)
        
        // then
        let expectation = true
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_A_A_A_카드를_가지면_true를_반환한다() throws {
        // given
        let heartA = Card(suit: .heart, denomination: .ace)
        let spaceA = Card(suit: .spade, denomination: .ace)
        let clubA = Card(suit: .club, denomination: .ace)
        let cards: [Card] = [heartA, spaceA, clubA]
        
        // when
        let result = sut.isTotalPointUnderThreshold(of: cards)
        
        // then
        let expectation = true
        XCTAssertEqual(result, expectation)
    }
}
