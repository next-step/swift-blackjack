//
//  CardScoreRuleTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/23.
//

import XCTest

class CardScoreRuleTest: XCTestCase {

    func test_BlackjackCardScore에서_점수가_21에_가깝게_계산될수있도록_ace가_11로_계산되는경우() {
        // given
        let cardDeck = BlackjackCardDeck()
        cardDeck.append(card: Card(rank: .ace, suit: .heart))
        cardDeck.append(card: Card(rank: .ten, suit: .heart))
        
        // when
        let score = BlackjackScoreRule.countScore(cardDeck: cardDeck)
        // then
        XCTAssertEqual(score, 21)
    }
    
    func test_BlackjackCardScore에서_점수가_21에_가깝게_계산될수있도록_ace가_1로_계산되는경우() {
        // given
        let cardDeck = BlackjackCardDeck()
        cardDeck.append(card: Card(rank: .ace, suit: .heart))
        cardDeck.append(card: Card(rank: .ten, suit: .heart))
        cardDeck.append(card: Card(rank: .two, suit: .heart))
        
        // when
        let score = BlackjackScoreRule.countScore(cardDeck: cardDeck)
        // then
        XCTAssertEqual(score, 13)
    }
}
