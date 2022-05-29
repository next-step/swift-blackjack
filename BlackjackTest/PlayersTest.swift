//
//  PlayersTest.swift
//  BlackjackTest
//
//  Created by 카카오VX on 2022/05/08.
//

import XCTest

class PlayersTest: XCTestCase {
    override func setUpWithError() throws {
    
    }

    override func tearDownWithError() throws {
        
    }
    
    func testPlayers_make_success() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        
        XCTAssertNotNil(players)
    }
    
    func testPlayers_make_fail() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [], cardDeck: cardDeck)
        
        XCTAssertNotNil(players)
    }
    
    func testPlayers_handOutFirstHand() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        players?.handOutFirstHand()
        
        guard let participant = players?.turnToPlayer() else { return }
        
        XCTAssertEqual(participant.giveName(), "mansa")
        XCTAssertTrue(participant.score() > 2)
    }
    
    func testPlayers_turnToPlayer() {
        let cardDeck = CardDeck(cards: CardDeckGenerator.generate())!
        let players = Players(with: [("mansa", 1000), ("zombie", 2000)],
                              cardDeck: cardDeck)
        players?.handOutFirstHand()
        guard let participant = players?.turnToPlayer() else { return }
        
        XCTAssertEqual(participant.giveName(), "mansa")
        
        participant.hitOrStay(false)
        players?.turnForPlayer { participant in
            XCTAssertEqual(players?.turnToPlayer()?.giveName(), "zombie")
        }
    }
}
