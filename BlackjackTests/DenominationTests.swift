//
//  DenominationTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class DenominationTests: XCTestCase {

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
        let input = Denomination.king
        
        // when
        let result = input.point
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    func test_addablePoint_ace_10() throws {
        // given
        let input = Denomination.ace
        
        // when
        let result = input.addablePoint
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    func test_addablePoints_exceptAce_allSatisfy_0() throws {
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
}
