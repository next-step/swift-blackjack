//
//  ScoreTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/04.
//

import XCTest

class ScoreTest: XCTestCase {
    func testScore_ace_1() {
        let score = Score.from(rank: Rank.A, aceUsingOne: true)
        XCTAssertEqual(score, 1)
    }
    
    func testScore_ace_11() {
        let score = Score.from(rank: Rank.A)
        XCTAssertEqual(score, 11)
    }
    
    func testScore_2_To_9() {
        let two = Score.from(rank: Rank.two)
        XCTAssertEqual(two, 2)
        
        let three = Score.from(rank: Rank.three)
        XCTAssertEqual(three, 3)
        
        let four = Score.from(rank: Rank.four)
        XCTAssertEqual(four, 4)
        
        let five = Score.from(rank: Rank.five)
        XCTAssertEqual(five, 5)
        
        let six = Score.from(rank: Rank.six)
        XCTAssertEqual(six, 6)
        
        let seven = Score.from(rank: Rank.seven)
        XCTAssertEqual(seven, 7)
        
        let eight = Score.from(rank: Rank.eight)
        XCTAssertEqual(eight, 8)
        
        let nine = Score.from(rank: Rank.nine)
        XCTAssertEqual(nine, 9)
    }
    
    func testScore_J_K_Q() {
        let j = Score.from(rank: Rank.J)
        XCTAssertEqual(j, 10)
        
        let k = Score.from(rank: Rank.K)
        XCTAssertEqual(k, 10)
        
        let q = Score.from(rank: Rank.Q)
        XCTAssertEqual(q, 10)
    }
}
