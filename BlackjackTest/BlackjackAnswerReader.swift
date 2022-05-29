//
//  BlackjackAsnwerReadDelegateTEst.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/26.
//

import XCTest

class BlackjackAnswerReaderTest: XCTestCase {

    func test_딜러는_보유한_카드점수합계가_16이하이면_카드를_받는다고_응답한다() throws {
        // given
        let answerReader = BlackjackAnswerReader()
        
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let cardsHaving16Score = [Card(rank: .ten, suit: .club), Card(rank: .six, suit: .club)]
        
        dealer.receive(cards: cardsHaving16Score)
        
        // when
        let answer = try answerReader.readAnswer(player: dealer)
        
        // then
        XCTAssertEqual(answer, .yes)
    }
}
