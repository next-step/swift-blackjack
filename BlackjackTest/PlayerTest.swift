//
//  Player.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

class PlayerTest: XCTestCase {

    func test_receive_카드를_수령하면_player의_카드덱에_담긴다() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let card = Card(id: .ace, symbol: .heart)
        
        // when
        player.receive(cards: [card])
        
        // then
        XCTAssertTrue(player.cardDeck.cards.contains(card))
    }
    
    func test_countScore() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let cardOne = Card(id: .ace, symbol: .heart)
        let cardTwo = Card(id: .ten, symbol: .diamond)
        let cardThree = Card(id: .jack, symbol: .diamond)
        
        player.receive(cards: [cardOne, cardTwo, cardThree])

        // when
        let score = player.countScore()
        
        // then
        XCTAssertEqual(score, 21)
    }
}
