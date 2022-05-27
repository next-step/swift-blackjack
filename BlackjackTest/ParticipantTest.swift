//
//  ParticipantTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/04.
//

import XCTest

class ParticipantTest: XCTestCase {
    func testParticipant_make_success() {
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        
        XCTAssertNotNil(participant)
    }
    
    func testParticipant_name() {
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        
        XCTAssertEqual(participant.giveName(), "Mansa")
    }
    
    func testParticipant_handDescription() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        participant.takeAFirstHand(hand)
        
        XCTAssertEqual(participant.giveHandDescription(), "A♣, 2♥")
    }
    
    func testParticipant_hitOrStay() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        participant.takeAFirstHand(hand)
        
        XCTAssertEqual(participant.giveIsHit(), true)
        
        participant.hitOrStay(false)
        
        XCTAssertEqual(participant.giveIsHit(), false)
    }
    
    func testParticipant_score() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        participant.takeAFirstHand(hand)
        
        XCTAssertEqual(participant.score(), 13)
    }
    
    func testParticipant_takeAFirstHand() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        participant.takeAFirstHand(hand)
        
        XCTAssertEqual(participant.giveHandDescription(), "A♣, 2♥")
    }
   
    func testParticipant_hit_success() {
        //hand_score가 21이 넘지 않을 떄
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let participant = Participant(name: "Mansa", bettingAmount: 1000)
        participant.takeAFirstHand(hand)
        let card = Card(rank: .seven, suit: .spades)
        
        participant.hit(card: card)
        
        XCTAssertEqual(participant.giveHandDescription(), "A♣, 2♥, 7♠")
    }
    
    func testParticipant_record_win() {
        let participant = Participant(name: "만사", bettingAmount: 1000)
        participant.record(.win, amount: participant.betting())
        
        XCTAssertEqual(participant.giveWinLoseRecord(), "승")
    }
    
    func testParticipant_record_lose() {
        let participant = Participant(name: "만사", bettingAmount: 1000)
        participant.record(.lose, amount: participant.betting())
        
        XCTAssertEqual(participant.giveWinLoseRecord(), "패")
    }
}
