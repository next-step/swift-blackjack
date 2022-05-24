//
//  ParticipantTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/04.
//

import XCTest

class ParticipantTest: XCTestCase {
    func testParticipant_make_success() {
        let participant = Participant(name: "Mansa")
        
        XCTAssertNotNil(participant)
    }
    
    func testParticipant_name() {
        let participant = Participant(name: "Mansa")
        
        XCTAssertEqual(participant.giveName(), "Mansa")
    }
    
    func testParticipant_handDescription() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(hand: hand, name: "Mansa")
        
        XCTAssertEqual(participant.giveHandDescription(), "A♣, 2♥")
    }
    
    func testParticipant_hitOrStay() {
        let participant = Participant(name: "Mansa")
        
        XCTAssertEqual(participant.giveIsHit(), true)
        
        participant.hitOrStay(false)
        
        XCTAssertEqual(participant.giveIsHit(), false)
    }
    
    func testParticipant_score() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(hand: hand, name: "Mansa")
        
        XCTAssertEqual(participant.score(), 13)
    }
    
    func testParticipant_takeAFirstHand() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(name: "Mansa")
        participant.takeAFirstHand(hand)
        
        XCTAssertEqual(participant.giveHandDescription(), "A♣, 2♥")
    }
   
    func testParticipant_hit_success() {
        //hand_score가 21이 넘지 않을 떄
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(hand: hand, name: "Mansa")
        let card = Card(rank: .seven, suit: .spades)
        
        participant.hit(card: card)
        
        XCTAssertEqual(participant.giveHandDescription(), "A♣, 2♥, 7♠")
    }
    
    func testParticipant_hit_fail() {
        //hand_score가 21이 넘을 때
    }
    
    func testParticipant_stay_success() {
        //추가 카드를 원하지 않을 경우, 딜러는 카드의 합이 17이상이면 추가 카드 받을 수 없음
    }
    
    func testParticipant_stay_fail() {
        //추가 카드를 원하지 않을 경우, 딜러는 카드의 합이 17이상이면 추가 카드 받을 수 없음
    }
}
