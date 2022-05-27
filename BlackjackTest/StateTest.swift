//
//  StateTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/08.
//

import XCTest

class StateTest: XCTestCase {
    func testState_make_success() {
        let state = State(bettingAmount: 1000)
        
        XCTAssertNotNil(state)
    }
    
    func testState_basicStory_for_participant() {
        let participant = Participant(name: "만사", bettingAmount: 1000)
        participant.hitOrStay(true)
        
        XCTAssertTrue(participant.giveIsHit())
        
        participant.hitOrStay(false)
        
        XCTAssertFalse(participant.giveIsHit())
        
        participant.record(.win, amount: 1000)
        
        XCTAssertEqual(participant.giveWinLoseRecord(), "승")
    }
    
    func testState_basicStory_for_dealer() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let state = State(bettingAmount: 1000)
        let dealer = Dealer(hand: hand, state: state)
        
        dealer.hitOrStay(true)
        
        XCTAssertTrue(dealer.giveIsHit())
        
        dealer.hitOrStay(false)
        
        XCTAssertFalse(dealer.giveIsHit())
        
        dealer.record(.win)
        dealer.record(.lose)
        
        XCTAssertEqual(dealer.giveWinLoseRecord(), "1승 1패")
    }
}
