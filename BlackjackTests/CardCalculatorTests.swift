//
//  CardCalculatorTests.swift
//  CardCalculatorTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class CardCalculatorTests: XCTestCase {

    var sut: CardCalculator!
    
    override func setUpWithError() throws {
        sut = CardCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_calculate_2_3_4_카드를_가지면_9을_반환한다() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let heart3 = Card(suit: .heart, denomination: .three)
        let heart4 = Card(suit: .heart, denomination: .four)
        let cards: [Card] = [heart2, heart3, heart4]
        
        // when
        let result = sut.calcuate(of: cards)
        
        // then
        let expectation = 9
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_2_3_K_카드를_가지면_15을_반환한다() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let heart3 = Card(suit: .heart, denomination: .three)
        let heartK = Card(suit: .heart, denomination: .king)
        let cards: [Card] = [heart2, heart3, heartK]
        
        // when
        let result = sut.calcuate(of: cards)
        
        // then
        let expectation = 15
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_J_Q_K_카드를_가지면_30을_반환한다() throws {
        // given
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        let cards: [Card] = [heartJ, heartQ, heartK]
        
        // when
        let result = sut.calcuate(of: cards)
        
        // then
        let expectation = 30
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_2_3_A_카드를_가지면_A는_11로_계산되어_16을_반환한다() throws {
        // given
        let heart2 = Card(suit: .heart, denomination: .two)
        let heart3 = Card(suit: .heart, denomination: .three)
        let heartA = Card(suit: .heart, denomination: .ace)
        let cards: [Card] = [heart2, heart3, heartA]
        
        // when
        let result = sut.calcuate(of: cards)
        
        // then
        let expectation = 16
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_5_6_A_카드를_가지면_A는_1로_계산되어_12을_반환한다() throws {
        // given
        let heart5 = Card(suit: .heart, denomination: .five)
        let heart6 = Card(suit: .heart, denomination: .six)
        let heartA = Card(suit: .heart, denomination: .ace)
        let cards: [Card] = [heart5, heart6, heartA]
        
        // when
        let result = sut.calcuate(of: cards)
        
        // then
        let expectation = 12
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_A_A_A_카드를_가지면_A는_11_1_1로_계산되어_13을_반환한다() throws {
        // given
        let heartA = Card(suit: .heart, denomination: .ace)
        let spaceA = Card(suit: .spade, denomination: .ace)
        let clubA = Card(suit: .club, denomination: .ace)
        let cards: [Card] = [heartA, spaceA, clubA]
        
        // when
        let result = sut.calcuate(of: cards)
        
        // then
        let expectation = 13
        XCTAssertEqual(result, expectation)
    }
}
