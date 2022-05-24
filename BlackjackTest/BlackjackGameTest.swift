//
//  BlackjackGameTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest
@testable import Blackjack

class BlackjackGameTest: XCTestCase {
    var cardDistributor: CardDistributor!
    var readAnswerDelegate: ReadAnswerDelegate
    
    override func setUpWithError() throws {
        cardDistributor = NonDuplicateCardDistributor(cards: TrumpCards.value, cardPickStrategy: RandomCardPickStrategy())
        readAnswerDelegate = BlackjackAnswerReader()
    }
    
    override func tearDownWithError() throws {
        cardDistributor = nil
    }

    func test_init_모든_player에게_카드를_2장씩_배부한다() {
        // given
        let playerOne = Player(name: PlayerName("kim"), cardDeck: BlackjackCardDeck())
        let playerTwo = Player(name: PlayerName("lee"), cardDeck: BlackjackCardDeck())
        
        // when
        let blackjackGame = BlackjackGame(players: [playerOne, playerTwo],
             cardDistributor: cardDistributor,
             answerReaderDelegate: readAnswerDelegate)
        
        // then
        XCTAssertTrue(playerOne.cardDeck.cards.count == 2)
        XCTAssertTrue(playerTwo.cardDeck.cards.count == 2)
    }
 }
