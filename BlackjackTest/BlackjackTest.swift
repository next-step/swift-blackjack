//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by 남기범 on 2021/11/15.
//

import XCTest

class BlackjackTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_gamer_card_sum() {
        let gammer = CardGammer()
        gammer.pickCard(Card(number: 3, type: .hart))
        gammer.pickCard(Card(number: 5, type: .spade))
        
        XCTAssertEqual(8, gammer.cardSum)
    }
}
