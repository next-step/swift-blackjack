//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/03.
//

import XCTest

class BlackjackTest: XCTestCase {
    func testBlackjack_make_success() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: ["mansa","zombie"], cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        
        XCTAssertNotNil(game)
    }
    
    func testBlackjack_handOutFirstHand() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: ["mansa","zombie"], cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        game.handOutFirstHand()
        guard let turnToPlayer = players?.turnToPlayer() else { return }
        
        XCTAssertTrue(turnToPlayer.score() > 2)
    }
}
