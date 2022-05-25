//
//  HandTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/04.
//

import XCTest

class HandTest: XCTestCase {
    func testHand_make_success() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .seven, suit: .hearts)]
        let hand = Hand(cards: cards)
        
        XCTAssertNotNil(hand)
    }
    
    func testHand_make_empty_success() {
        let hand = Hand(cards: [])
        
        XCTAssertNotNil(hand)
    }
    
    func testHand_score() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .seven, suit: .hearts)]
        let hand = Hand(cards: cards)
        let score = hand.score()
        
        XCTAssertEqual(score, 18)
    }

    func testHand_score_ace_one() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .seven, suit: .hearts),
                     Card(rank: .seven, suit: .spades)]
        let hand = Hand(cards: cards)
        let score = hand.score()
        
        XCTAssertEqual(score, 15)
    }

    func testHand_score_ace_eleven() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let hand = Hand(cards: cards)
        let score = hand.score()
        
        XCTAssertEqual(score, 16)
    }
    
    func testHand_select_score_same() {
        let cards = [Card(rank: .eight, suit: .clubs),
                     Card(rank: .six, suit: .hearts),
                     Card(rank: .seven, suit: .spades)]
        let hand = Hand(cards: cards)
        let selectScore = hand.selectScore(firstSelectableScore: 21, lastSelectableScore: 21)
        
        XCTAssertEqual(selectScore, 21)
    }
    
    func testHand_select_score_close_to_21() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let hand = Hand(cards: cards)
        let selectScore = hand.selectScore(firstSelectableScore: 18, lastSelectableScore: 21)
        
        XCTAssertEqual(selectScore, 21)
    }
    
    func testHand_select_score_first_over_21() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let hand = Hand(cards: cards)
        let selectScore = hand.selectScore(firstSelectableScore: 22, lastSelectableScore: 18)
        
        XCTAssertEqual(selectScore, 18)
    }
    
    func testHand_select_score_last_over_21() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let hand = Hand(cards: cards)
        let selectScore = hand.selectScore(firstSelectableScore: 18, lastSelectableScore: 24)
        
        XCTAssertEqual(selectScore, 18)
    }
    
    func testHand_description() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        let description = hand.giveHandDescription()
        
        XCTAssertEqual(description, "A♣, 2♥")
    }
    
    func testHand_hit() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let hand = Hand(cards: cards)
        
        XCTAssertEqual(hand.giveHandDescription(), "A♣, 2♥")
        XCTAssertEqual(hand.score(), 13)
        
        hand.hit(card: Card(rank: .three, suit: .spades))
        
        XCTAssertEqual(hand.giveHandDescription(), "A♣, 2♥, 3♠")
        XCTAssertEqual(hand.score(), 16)
    }
    
    func testHand_give_winningScore() {
        let cards = [Card(rank: .A, suit: .clubs),
                    Card(rank: .two, suit: .hearts)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        
        XCTAssertEqual(hand.giveWinningScore(), 21)
    }
}
