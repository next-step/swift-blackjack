//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by 남기범 on 2021/11/15.
//

import XCTest
@testable import Blackjack

class BlackjackTest: XCTestCase {
    var gammer: CardGammer!

    override func setUpWithError() throws {
        gammer = CardGammer(name: "짝귀")
    }

    override func tearDownWithError() throws {
        gammer = nil
    }
}


// MARK: - CardGamner Test

extension BlackjackTest {
    func test_gamer_card_sum_have_nomal_card() {
        gammer.pickCard(Card(number: 3, type: .hart))
        gammer.pickCard(Card(number: 5, type: .spade))
        
        XCTAssertEqual(8, gammer.cardSum)
    }
    
    func test_gamer_card_sum_have_king_queen_jack() {
        gammer.pickCard(Card(number: nil, type: .jack))
        gammer.pickCard(Card(number: nil, type: .king))
        gammer.pickCard(Card(number: nil, type: .queen))
        
        XCTAssertEqual(30, gammer.cardSum)
    }
    
    func test_gamer_card_sum_have_ace() {
        gammer.pickCard(Card(number: nil, type: .ace))
        gammer.pickCard(Card(number: nil, type: .jack))
        
        XCTAssertEqual(21, gammer.cardSum)
    }
}
