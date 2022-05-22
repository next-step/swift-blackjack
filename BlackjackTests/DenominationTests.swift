//
//  DenominationTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class DenominationTests: XCTestCase {

    // MARK: - point
    
    func test_point_ace_1() throws {
        // given
        let input = Denomination.ace
        
        // when
        let result = input.point
        
        // then
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_two_1() throws {
        // given
        let input = Denomination.two
        
        // when
        let result = input.point
        
        // then
        let expectation = 2
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_three_3() throws {
        // given
        let input = Denomination.three
        
        // when
        let result = input.point
        
        // then
        let expectation = 3
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_four_4() throws {
        // given
        let input = Denomination.four
        
        // when
        let result = input.point
        
        // then
        let expectation = 4
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_three_5() throws {
        // given
        let input = Denomination.five
        
        // when
        let result = input.point
        
        // then
        let expectation = 5
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_six_6() throws {
        // given
        let input = Denomination.six
        
        // when
        let result = input.point
        
        // then
        let expectation = 6
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_seven_7() throws {
        // given
        let input = Denomination.seven
        
        // when
        let result = input.point
        
        // then
        let expectation = 7
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_eight_8() throws {
        // given
        let input = Denomination.eight
        
        // when
        let result = input.point
        
        // then
        let expectation = 8
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_nine_9() throws {
        // given
        let input = Denomination.nine
        
        // when
        let result = input.point
        
        // then
        let expectation = 9
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_ten_10() throws {
        // given
        let input = Denomination.ten
        
        // when
        let result = input.point
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_king_10() throws {
        // given
        let input = Denomination.king
        
        // when
        let result = input.point
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_queen_10() throws {
        // given
        let input = Denomination.queen
        
        // when
        let result = input.point
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    func test_point_jack_10() throws {
        // given
        let input = Denomination.jack
        
        // when
        let result = input.point
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - addablePoint
    
    func test_addablePoint_ace_10() throws {
        // given
        let input = Denomination.ace
        
        // when
        let result = input.addablePoint
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    func test_addablePoints_ace_를_제외하면_모두_0() throws {
        // given
        let denominations = Denomination.allCases.filter { denomination in
            denomination != .ace
        }
        
        // when
        let addablePoints = denominations.map { denomination in
            denomination.addablePoint
        }
        
        // then
        let expectation = 0
        let result = addablePoints.allSatisfy { addablePoint in
            addablePoint == expectation
        }
        
        XCTAssertTrue(result)
    }
    
    // MARK: - guideDescription
    
    func test_guideDescription_ace_A() throws {
        // given
        let input = Denomination.ace
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "A"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_king_K() throws {
        // given
        let input = Denomination.king
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "K"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_queen_Q() throws {
        // given
        let input = Denomination.queen
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "Q"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_jack_J() throws {
        // given
        let input = Denomination.jack
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "J"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_ace_king_queen_jack을_제외하면_point를_String으로_표현한것과_같다() throws {
        // given
        let notNumberDenominations: [Denomination] = [.ace, .king, .queen, .jack]
        let numberDenominations = Denomination.allCases.filter { denomination in
            !notNumberDenominations.contains(denomination)
        }
        
        // when
        // then
        numberDenominations.forEach { numberDenomination in
            let result = numberDenomination.guideDescription
            let expectation = numberDenomination.point.description
            XCTAssertEqual(result, expectation)
        }
    }
}
