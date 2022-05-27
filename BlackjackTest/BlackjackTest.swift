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
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        
        XCTAssertNotNil(game)
    }
    
    func testBlackjack_handOutFirstHand() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        game.handOutFirstHand()
        guard let turnToPlayer = players?.turnToPlayer() else { return }
        
        XCTAssertTrue(turnToPlayer.score() > 2)
    }
    
    func testBlackjack_make_turnToPlayer() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        
        XCTAssertEqual(game.turnToPlayer()!.giveName(), "mansa")
    }
    
    func testBlackjack_make_dealer() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        
        XCTAssertEqual(game.dealer()!.giveName(), "딜러")
    }
    
    func testBlackjack_make_winOrLoseForPlayer() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        var results: [String] = []
        
        game.winOrLoseForPlayer { player in
            results.append(player.giveWinLoseRecord())
        }
        
        XCTAssertEqual(results.count, 3)
    }
    
    func testBlackjack_story_isPlayingGame() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        let game = BlackjackGame(players: players!)
        
        XCTAssertEqual(game.isPlayingGame(), true)
        
        game.forEachPlayers { player in
            player.hitOrStay(false)
        }
        
        XCTAssertEqual(game.isPlayingGame(), false)
    }
}
