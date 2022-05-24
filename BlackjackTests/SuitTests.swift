//
//  SuitTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class SuitTests: XCTestCase {

    // MARK: - guideDescription
    
    func test_guideDescription_heart_하트() throws {
        // given
        let input = Suit.heart
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "하트"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_spade_스페이드() throws {
        // given
        let input = Suit.spade
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "스페이드"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_club_클로버() throws {
        // given
        let input = Suit.club
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "클로버"
        XCTAssertEqual(result, expectation)
    }
    
    func test_guideDescription_diamond_다이아몬드() throws {
        // given
        let input = Suit.diamond
        
        // when
        let result = input.guideDescription
        
        // then
        let expectation = "다이아몬드"
        XCTAssertEqual(result, expectation)
    }
}
