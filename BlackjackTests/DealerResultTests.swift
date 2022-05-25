//
//  DealerResultTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/26.
//

import XCTest

class DealerResultTests: XCTestCase {

    func test_description() throws {
        // given
        let dealer = Dealer()
        let heart3 = Card(suit: .heart, denomination: .three)
        dealer.appendCard(heart3)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer.appendCard(diamond2)
        
        let samePointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        samePointGamer.appendCard(diamond3)
        
        let highPointGamer = Gamer(name: "headongchung")
        let diamond4 = Card(suit: .diamond, denomination: .four)
        highPointGamer.appendCard(diamond4)
        
        let gamers: [Gamer] = [lowPointGamer, samePointGamer, highPointGamer]
        
        let sut = DealerResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.description
        
        // then
        let expectation = "1승 1무 1패"
        XCTAssertEqual(result, expectation)
    }
    
    func test_description_딜러가_더_높은_점수를_얻어도_burst_딜러라면_lose로_count한다() throws {
        // given
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        
        let burstDealer =  Dealer()
        burstDealer.appendCard(heartJ)
        burstDealer.appendCard(heartQ)
        burstDealer.appendCard(heartK)
        
        let lowPointGamer1 = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer1.appendCard(diamond2)
        
        let lowPointGamer2 = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        lowPointGamer2.appendCard(diamond3)
        
        let lowPointGamer3 = Gamer(name: "headongchung")
        let diamond4 = Card(suit: .diamond, denomination: .four)
        lowPointGamer3.appendCard(diamond4)
        
        let gamers: [Gamer] = [lowPointGamer1, lowPointGamer2, lowPointGamer3]
        
        let sut = DealerResult(dealer: burstDealer, gamers: gamers)
        
        // when
        let result = sut.description
        
        // then
        let expectation = "0승 0무 3패"
        XCTAssertEqual(result, expectation)
    }
    
    func test_description_게이머가_더_높은_점수를_얻어도_burst_게이머라면_win로_count한다() throws {
        // given
        let dealer = Dealer()
        let heart3 = Card(suit: .heart, denomination: .three)
        dealer.appendCard(heart3)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer.appendCard(diamond2)
        
        let samePointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        samePointGamer.appendCard(diamond3)
        
        let burstGamer = Gamer(name: "sujin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        burstGamer.appendCard(heartJ)
        burstGamer.appendCard(heartQ)
        burstGamer.appendCard(heartK)
        
        let gamers: [Gamer] = [lowPointGamer, samePointGamer, burstGamer]
        
        let sut = DealerResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.description
        
        // then
        let expectation = "2승 1무 0패"
        XCTAssertEqual(result, expectation)
    }
    
    func test_description_게이머가_없으면_딜러의_점수도_없다() throws {
        // given
        let dealer = Dealer()
        let heart3 = Card(suit: .heart, denomination: .three)
        dealer.appendCard(heart3)
        
        let sut = DealerResult(dealer: dealer, gamers: [])
        
        // when
        let result = sut.description
        
        // then
        let expectation = "0승 0무 0패"
        XCTAssertEqual(result, expectation)
    }
}
