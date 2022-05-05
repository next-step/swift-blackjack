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
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        
        XCTAssertNotNil(hand)
    }
    
    func testHand_make_fail() {
        let winningScore = WinningScore()
        let hand = Hand(cards: [], winningScore: winningScore)
        
        XCTAssertNil(hand)
    }
    
    func testHand_score() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .seven, suit: .hearts)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        let score = hand?.score()
        
        XCTAssertEqual(score, 18)
    }

    func testHand_score_ace_one() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .seven, suit: .hearts),
                     Card(rank: .seven, suit: .spades)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        let score = hand?.score()
        
        XCTAssertEqual(score, 15)
    }

    func testHand_score_ace_eleven() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        let score = hand?.score()
        
        XCTAssertEqual(score, 16)
    }
    
    func testHand_select_score_close_to_21() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        let selectScore = hand?.selectScore(firstSelectableScore: 18, lastSelectableScore: 21)
        
        XCTAssertEqual(selectScore, 21)
    }
    
    func testHand_select_score_first_over_21() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        let selectScore = hand?.selectScore(firstSelectableScore: 22, lastSelectableScore: 18)
        
        XCTAssertEqual(selectScore, 18)
    }
    
    func testHand_select_score_last_over_21() {
        let cards = [Card(rank: .A, suit: .clubs),
                     Card(rank: .two, suit: .hearts),
                     Card(rank: .three, suit: .spades)]
        let winningScore = WinningScore()
        let hand = Hand(cards: cards, winningScore: winningScore)
        let selectScore = hand?.selectScore(firstSelectableScore: 18, lastSelectableScore: 24)
        
        XCTAssertEqual(selectScore, 18)
    }
}
