//
//  CardDeckTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/23.
//

import XCTest
@testable import Blackjack

class CardDeckTest: XCTestCase {

    func test_append_추가한카드를_보관한다() {
        // given
        let cardDeck = BlackjackCardDeck()
        let card = Card(rank: .king, suit: .diamond)
        
        // when
        cardDeck.append(card: card)
        
        // then
        XCTAssertTrue(cardDeck.cards.contains(card))
    }
    
    func test_countScore_자신이_가진_cardScoreRule에_따라서_카드점수를_집계한다() {
        // given
        let cardDeck = BlackjackCardDeck()
        let firstCard = Card(rank: .king, suit: .diamond)
        let secondCard = Card(rank: .ace, suit: .heart)
        
        cardDeck.append(card: firstCard)
        cardDeck.append(card: secondCard)
        
        // when
        let score = cardDeck.countScore()
        
        // then
        XCTAssertEqual(score, 21)
    }
    
    func test_isBlackjack_블랙잭이면_true반환() {
        // given
        let cardDeck = BlackjackCardDeck()
        let firstCard = Card(rank: .king, suit: .diamond)
        let secondCard = Card(rank: .ace, suit: .heart)
        
        cardDeck.append(card: firstCard)
        cardDeck.append(card: secondCard)
        
        // when
        let result = cardDeck.isBlackjack()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isBlackjack_블랙잭아니면_false반환() {
        // given
        let cardDeck = BlackjackCardDeck()
        let firstCard = Card(rank: .ace, suit: .diamond)
        let secondCard = Card(rank: .ace, suit: .heart)
        
        cardDeck.append(card: firstCard)
        cardDeck.append(card: secondCard)
        
        // when
        let result = cardDeck.isBlackjack()
        
        // then
        XCTAssertFalse(result)
    }
}
