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
        let card = Card(id: .king, symbol: .diamond)
        
        // when
        cardDeck.append(card: card)
        
        // then
        XCTAssertTrue(cardDeck.cards.contains(card))
    }

}
