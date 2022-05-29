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
        let card = Card(rank: .ace, suit: .heart)
        
        // when
        player.receive(cards: [card])
        
        // then
        XCTAssertTrue(player.cardDeck.cards.contains(card))
    }
    
    func test_countScore_player가_가진_카드의_접수합계를_반환한다() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        let cardOne = Card(rank: .ace, suit: .heart)
        let cardTwo = Card(rank: .ten, suit: .diamond)
        let cardThree = Card(rank: .jack, suit: .diamond)
        
        player.receive(cards: [cardOne, cardTwo, cardThree])

        // when
        let score = player.countScore()
        
        // then
        XCTAssertEqual(score, 21)
    }
    
    func test_isBlackjack_플레이어가_가진_카드가_블랙잭이면_true() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        player.receive(cards: [Card(rank: .ace, suit: .heart), Card(rank: .king, suit: .heart)])
        
        // when
        let result = player.isBlackjack()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isBlackjack_플레이어가_가진_카드가_블랙잭이아니면_false() {
        // given
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck())
        player.receive(cards: [Card(rank: .ace, suit: .heart), Card(rank: .ace, suit: .diamond)])
        
        // when
        let result = player.isBlackjack()
        
        // then
        XCTAssertFalse(result)
    }
}
