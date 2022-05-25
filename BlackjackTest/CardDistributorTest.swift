//
//  CardDistributorTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

struct StubCardPickStrategy: CardPickStrategy {
    var card: Card
    func pick(among cards: [Card]) -> Card {
        return card
    }
}

class CardDistributorTest: XCTestCase {

    func test_NonDuplicateCardDistributor_뽑은카드는_더이상_CardDistributor에서_앞으로_반환할_카드_대상에_포함되지않는다() {
        // given
        let firstCard = Card(rank: .ace, suit: .heart)
        let secondCard = Card(rank: .ace, suit: .diamond)
        let stubCardPickStrategy = StubCardPickStrategy(card: firstCard)
        
        let cardDistributor = NonDuplicateCardDistributor(cards: [firstCard, secondCard], cardPickStrategy: stubCardPickStrategy)
    
        // when
        let _ = cardDistributor.distribute(count: 1)
        
        // then
        XCTAssertFalse(cardDistributor.cards.contains(firstCard))
    }
}
