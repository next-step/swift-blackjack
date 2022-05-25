//
//  StateTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/08.
//

import XCTest

class StateTest: XCTestCase {
    func testState_make_success() {
        let state = State()
        
        XCTAssertNotNil(state)
    }
    
    func testState_basicStory_for_participant() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let state = State()
        let participant = Participant(hand: hand, name: "만사", state: state)
        participant.hitOrStay(true)
        
        XCTAssertTrue(participant.giveIsHit())
        
        participant.hitOrStay(false)
        
        XCTAssertFalse(participant.giveIsHit())
        
        participant.record(.win)
        
        XCTAssertEqual(participant.giveWinLoseRecord(), "승")
    }
    
    func testState_basicStory_for_dealer() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let state = State()
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
