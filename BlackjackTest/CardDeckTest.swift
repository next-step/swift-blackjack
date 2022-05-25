//
//  CardDeckTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/04.
//

import XCTest

class CardDeckTest: XCTestCase {
    func testCardDeck_make_success() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())
        XCTAssertNotNil(cardDeck)
    }

    func testCardDeck_make_fail() {
        let cardDeck = CardDeck(cards: [])
        XCTAssertNil(cardDeck)
    }
    
    func testCardDeck_count() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())
        XCTAssertEqual(cardDeck?.count(), 52)
    }
    
    func testCardDeck_handOut() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())
        _ = cardDeck?.handOutCard()
        XCTAssertEqual(cardDeck?.count(), 51)
        _ = cardDeck?.handOutCard()
        XCTAssertEqual(cardDeck?.count(), 50)
    }
    
    func testCardDeck_shuffle() {
        let cardDeckBeforeShuffle = CardDeck(cards: CardDeckGenerator.generate())
        let cardDeckAfterShuffle = CardDeck(cards: CardDeckGenerator.generate())
        
        XCTAssertEqual(cardDeckBeforeShuffle?.handOutCard(), cardDeckAfterShuffle?.handOutCard())
        
        cardDeckAfterShuffle?.shuffle()
        
        XCTAssertNotEqual(cardDeckBeforeShuffle?.handOutCard(), cardDeckAfterShuffle?.handOutCard())
    }
}
