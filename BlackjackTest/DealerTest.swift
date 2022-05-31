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
    
    func test_딜러와_참가자가_모두_21을_넘지않고_딜러가_더_클때_참가자는_패배() {
        let participant = Participant(name: "sut1")
        
        dealer.add(card: Card(shape: .spade, number: .ace))
        dealer.add(card: Card(shape: .spade, number: .king))
        
        participant.add(card: Card(shape: .spade, number: .jack))
        participant.add(card: Card(shape: .spade, number: .queen))
        
        XCTAssertEqual(participant.isWin(compareWith: dealer), .defeat)
    }
    
    func test_딜러와_참가자가_모두_21을_넘지않고_참가자가_더_클때_참가자는_승리() {
        let participant = Participant(name: "sut1")
        
        dealer.add(card: Card(shape: .spade, number: .jack))
        dealer.add(card: Card(shape: .spade, number: .queen))
        
        participant.add(card: Card(shape: .spade, number: .ace))
        participant.add(card: Card(shape: .spade, number: .king))
        
        XCTAssertEqual(participant.isWin(compareWith: dealer), .win)
    }
    
    func test_참가자만_21을_넘었을때_참가자는_패배() {
        let participant = Participant(name: "sut1")
        
        dealer.add(card: Card(shape: .spade, number: .six))
        dealer.add(card: Card(shape: .heart, number: .six))
        dealer.add(card: Card(shape: .spade, number: .five))
        
        participant.add(card: Card(shape: .clover, number: .six))
        participant.add(card: Card(shape: .diamond, number: .six))
        participant.add(card: Card(shape: .heart, number: .king))
        
        XCTAssertEqual(participant.isWin(compareWith: dealer), .defeat)
    }
    
    func test_딜러만_21을_넘었을때_참가자는_승리() {
        let participant = Participant(name: "sut1")
        
        dealer.add(card: Card(shape: .clover, number: .six))
        dealer.add(card: Card(shape: .diamond, number: .six))
        dealer.add(card: Card(shape: .heart, number: .king))
        
        participant.add(card: Card(shape: .spade, number: .jack))
        participant.add(card: Card(shape: .spade, number: .queen))
        
        XCTAssertEqual(participant.isWin(compareWith: dealer), .win)
    }
    
    func test_딜러와_참가자_모두_21을_넘었을때_참가자는_패배() {
        let participant = Participant(name: "sut1")
        
        dealer.add(card: Card(shape: .clover, number: .six))
        dealer.add(card: Card(shape: .diamond, number: .six))
        dealer.add(card: Card(shape: .heart, number: .king))
        
        participant.add(card: Card(shape: .spade, number: .six))
        participant.add(card: Card(shape: .heart, number: .six))
        participant.add(card: Card(shape: .spade, number: .king))
        
        XCTAssertEqual(participant.isWin(compareWith: dealer), .defeat)
    }
    
    func test_참가자가_10000원을_베팅하고_승리하면_수익은_10000원() {
        let participant = Participant(name: "sut1")
        participant.bet(amount: 10000)
        
        let expected = 10000
        
        XCTAssertEqual(participant.calculateIncome(winningState: .win), expected)
    }
}
