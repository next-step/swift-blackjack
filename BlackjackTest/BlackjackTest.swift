//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by 이우섭 on 2022/05/26.
//

import XCTest

class BlackjackTest: XCTestCase {
    func test_블랙잭에_참가자가_참가() {
        let participantNames: [String] = ["sut1", "sut2"]
        let blackjack = Blackjack(participantNames: participantNames)
        
        let expected: Int = 2
        
        XCTAssertEqual(blackjack.participants.count, expected)
    }
    
    func test_블랙잭이_시작할때_참가자에게_카드_두개를_분배() {
        let participantNames = ["sut1"]
        let blackjack = Blackjack(participantNames: participantNames)
        blackjack.start()
        
        let expected: Int = 2
        
        XCTAssertEqual(blackjack.participants.first!.cards.count, expected)
    }
}
