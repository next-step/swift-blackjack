//
//  Player.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

class PlayerTest: XCTestCase {

    func test_receive() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let card = Card(id: .ace, symbol: .heart)
        
        // when
        player.receive(cards: [card])
        
        // then
        XCTAssertTrue(player.cardDeck.cards.contains(card))
    }
}
