//
//  DealerTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/08.
//

import XCTest

class DealerTest: XCTestCase {
    func testDealer_make_success() {
        let dealer = Dealer()
        
        XCTAssertNotNil(dealer)
    }
    
    func testDealer_make_name() {
        let dealer = Dealer()
        let name = dealer.giveName()
        
        XCTAssertEqual(name, "딜러")
    }
    
    func testDealer_handDescription() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let dealer = Dealer()
        dealer.takeAFirstHand(hand)
        
        XCTAssertEqual(dealer.giveHandDescription(), "A♣, 2♥")
    }
    
    func testDealer_hit_success() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let dealer = Dealer()
        dealer.takeAFirstHand(hand)
        dealer.hitOrStay(true)
        dealer.hit(card: Card(rank: .A, suit: .hearts))
        
        XCTAssertEqual(dealer.giveHandDescription(), "A♣, 2♥, A♥")
    }
    
    func testDealer_giveIsHit() {
        let dealer = Dealer(hand: Hand(cards: [Card(rank: .J, suit: .clubs),
                                               Card(rank: .four, suit: .hearts)]))
        
        XCTAssert(dealer.giveIsHit())
        
        dealer.hitOrStay(false)
        
        XCTAssertFalse(dealer.giveIsHit())
    }
    
    func testDealer_score() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let dealer = Dealer(hand: hand)
        dealer.takeAFirstHand(hand)
        
        XCTAssertEqual(dealer.score(), 13)
    }
    
    func testDealer_takeAFirstHand() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let dealer = Dealer()
        dealer.takeAFirstHand(hand)
        
        XCTAssertEqual(dealer.giveHandDescription(), "A♣, 2♥")
    }
    
    func testDealer_record() {
        let dealer = Dealer()
        dealer.record(.lose)
        dealer.record(.lose)
        dealer.record(.win)
        dealer.record(.win)
        dealer.record(.win)
        
        XCTAssertEqual(dealer.giveWinLoseRecord(), "3승 2패")
    }
}
