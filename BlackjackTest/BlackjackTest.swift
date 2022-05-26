//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by 이우섭 on 2022/05/26.
//

import XCTest

class BlackjackTest: XCTestCase {
    func test_블랙잭에_참가자가_참가() {
        let participantNames = ["sut1", "sut2"]
        let blackjack = Blackjack(participantNames: participantNames)
        
        let expected: Int = 2
        
        XCTAssertEqual(blackjack.participants.count, expected)
    }
}
