//
//  ParticipantTest.swift
//  BlackjackTest
//
//  Created by 이우섭 on 2022/05/31.
//

import XCTest

class ParticipantTest: XCTestCase {
    var participant: Participant = Participant(name: "sut")
    
    override func setUpWithError() throws {
        self.participant = Participant(name: "sut")
    }
    
    func test_블랙잭_참가자가_에이스_카드가_없을때_점수_계산() {
        participant.add(card: Card(shape: .spade, number: .two))
        participant.add(card: Card(shape: .spade, number: .eight))
        
        let expected = 10
        
        XCTAssertEqual(participant.score, expected)
    }
    
    func test_블랙잭_참가자가_에이스를_가지고_있고_11로_계산해야_유리할때_점수_계산() {
        participant.add(card: Card(shape: .spade, number: .ace))
        participant.add(card: Card(shape: .spade, number: .eight))
        
        let expected = 19
        
        XCTAssertEqual(participant.score, expected)
    }
    
    func test_블랙잭_참가자가_에이스를_가지고_있고_1로_계산해야_유리할때_점수_계산() {
        participant.add(card: Card(shape: .spade, number: .ace))
        participant.add(card: Card(shape: .spade, number: .king))
        participant.add(card: Card(shape: .spade, number: .jack))
        
        let expected = 21
        
        XCTAssertEqual(participant.score, expected)
    }
    
    func test_참가자가_10000원을_베팅하고_승리하면_수익은_10000원() {
        participant.bet(amount: 10000)
        
        let expected = 10000
        
        XCTAssertEqual(participant.calculateIncome(winningState: .win), expected)
    }
    
    func test_참가자가_10000원을_베팅하고_패배하면_손해는_10000원() {
        participant.bet(amount: 10000)
        
        let expected = -10000
        
        XCTAssertEqual(participant.calculateIncome(winningState: .defeat), expected)
    }
}
