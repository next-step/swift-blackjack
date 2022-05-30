//
//  DealerTest.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/30.
//

import XCTest

class DealerTest: XCTestCase {
    var dealer: Dealer = Dealer()
    
    override func setUpWithError() throws {
        self.dealer = Dealer()
    }
    
    func test_블랙잭_딜러의_카드_총합이_16이하일때_카드를_한장_더_가져옴() {
        dealer.add(card: Card(shape: .spade, number: .king))
        dealer.add(card: Card(shape: .spade, number: .six))
        
        let expected = Dealer.State.needToCard
        
        XCTAssertEqual(dealer.state, expected)
    }
    
    func test_블랙잭_딜러의_카드_총합이_16보다_클때_카드를_가져오지_않음() {
        dealer.add(card: Card(shape: .spade, number: .king))
        dealer.add(card: Card(shape: .spade, number: .seven))
        
        let expected = Dealer.State.enoughCard
        
        XCTAssertEqual(dealer.state, expected)
    }
    
    func test_딜러는_버스트_되지않는한_에이스를_11로_취급함() {
        dealer.add(card: Card(shape: .spade, number: .ace))
        dealer.add(card: Card(shape: .spade, number: .six))
        
        let expected = 17
        
        XCTAssertEqual(dealer.score, expected)
    }
    
    func test_딜러는_에이스를_가지고_있을때_11로_계산해서_버스트_될경우_1로_계산한다() {
        dealer.add(card: Card(shape: .spade, number: .ace))
        dealer.add(card: Card(shape: .spade, number: .five))
        dealer.add(card: Card(shape: .spade, number: .six))
        
        let expected = 12
        
        XCTAssertEqual(dealer.score, expected)
        
    }
}
