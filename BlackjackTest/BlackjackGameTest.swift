//
//  BlackjackGameTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest
@testable import Blackjack

class StubAnswerReader: ReadAnswerDelegate {
    var answer: [Answer] = []
    private var index = 0

    func readAnswer(player: Player) throws -> Answer {
        let result = answer[index]
        index += 1
        return result
    }
}

class BlackjackGameTest: XCTestCase {
    var cardDistributor: CardDistributor!
    
    override func setUpWithError() throws {
        cardDistributor = NonDuplicateCardDistributor(cards: TrumpCards.value, cardPickStrategy: RandomCardPickStrategy())
    }
    
    override func tearDownWithError() throws {
        cardDistributor = nil
    }

    func test_init_모든_player에게_카드를_2장씩_배부한다() throws {
        // given
        let playerOne = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let playerTwo = Player(name: PlayerName("lee")!, cardDeck: BlackjackCardDeck())
        let answerReader = StubAnswerReader()
        
        // when
        _ = try BlackjackGame(players: [playerOne, playerTwo],
                              cardDistributor: cardDistributor,
                              answerReaderDelegate: answerReader)
        
        // then
        XCTAssertTrue(playerOne.cardDeck.cards.count == 2)
        XCTAssertTrue(playerTwo.cardDeck.cards.count == 2)
    }
    
    func test_start_answerDelegate에서_yes를_얻은만큼_player는_카드를_획득한다() throws {
        // given
        let playerOne = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let playerTwo = Player(name: PlayerName("lee")!, cardDeck: BlackjackCardDeck())
        let answerReader = StubAnswerReader()
        answerReader.answer = [.yes, .yes, .no, .yes, .yes, .yes, .no]
        
        let blackjackGame = try BlackjackGame(players: [playerOne, playerTwo],
                                              cardDistributor: cardDistributor,
                                              answerReaderDelegate: answerReader)
        // when
        _ = try blackjackGame.start()
        
        // then
        XCTAssertTrue(playerOne.cardDeck.cards.count == 4)
        XCTAssertTrue(playerTwo.cardDeck.cards.count == 5)
    }
}
