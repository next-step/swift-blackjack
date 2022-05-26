//
//  CardDistributorTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

struct StubCardPickStrategy: CardPickStrategy {
    var card: Card?
    
    func pick<Cards>(among cards: Cards) -> Card? where Cards : Collection, Cards.Element == Card {
        return card
    }
}

class CardDistributorTest: XCTestCase {

    func test_NonDuplicateCardDistributor_뽑은카드는_더이상_CardDistributor에서_앞으로_반환할_카드_대상에_포함되지않는다() throws {
        // given
        let firstCard = Card(rank: .ace, suit: .heart)
        let stubCardPickStrategy = StubCardPickStrategy(card: firstCard)
        
        let cardDistributor = NonDuplicateCardDistributor(cards: [firstCard], cardPickStrategy: stubCardPickStrategy)
    
        // when
        let _ = try cardDistributor.distribute(count: 1)
        
        // then
        XCTAssertFalse(cardDistributor.cards.contains(firstCard))
    }
    
    func test_NonDuplicateCrdDistributore_주어진_개수만큼_뽑을_카드가_남아있지_않다면_error를_throw한다 () {
        // given
        let card = Card(rank: .ace, suit: .club)
        let stubCardPickStrategy = StubCardPickStrategy()
        let cardDistributor = NonDuplicateCardDistributor(cards: [card], cardPickStrategy: stubCardPickStrategy)
        
        // when
        // then
        XCTAssertThrowsError(try cardDistributor.distribute(count: 2))
    }
}
