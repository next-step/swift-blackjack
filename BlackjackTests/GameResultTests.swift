//
//  GameResultTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/25.
//

import XCTest

class GameResultTests: XCTestCase {

    // MARK: - outcome
    
    func test_outcome_유일한_최고_점수이면_win을_리턴한다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer.appendCard(diamond2)
        
        let highPointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        highPointGamer.appendCard(diamond3)
        
        let gamers: [Gamer] = [lowPointGamer, highPointGamer]
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: highPointGamer)
        
        // then
        let expectation: GameResult.OutCome = .win
        XCTAssertEqual(result, expectation)
    }
    
    func test_outcome_동률이_있는_최고_점수를_얻었을때_그_사람이_딜러가_아니면_win을_리턴한다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let samePointGamer1 = Gamer(name: "sujin")
        let heart3 = Card(suit: .heart, denomination: .three)
        samePointGamer1.appendCard(heart3)
        
        let samePointGamer2 = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        samePointGamer2.appendCard(diamond3)
        
        let gamers: [Gamer] = [samePointGamer1, samePointGamer2]
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: samePointGamer2)
        
        // then
        let expectation: GameResult.OutCome = .win
        XCTAssertEqual(result, expectation)
    }
    
    func test_outcome_동률이_있는_최고_점수를_얻었을때_그_사람이_딜러이면_draw을_리턴한다() throws {
        // given
        let dealer = Dealer()
        let heart3 = Card(suit: .heart, denomination: .three)
        dealer.appendCard(heart3)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer.appendCard(diamond2)
        
        let highPointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        highPointGamer.appendCard(diamond3)
        
        let gamers: [Gamer] = [lowPointGamer, highPointGamer]
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: highPointGamer)
        
        // then
        let expectation: GameResult.OutCome = .draw
        XCTAssertEqual(result, expectation)
    }
    
    func test_outcome_최고_점수가_아니면_lose을_리턴한다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer.appendCard(diamond2)
        
        let highPointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        highPointGamer.appendCard(diamond3)
        
        let gamers: [Gamer] = [lowPointGamer, highPointGamer]
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: lowPointGamer)
        
        // then
        let expectation: GameResult.OutCome = .lose
        XCTAssertEqual(result, expectation)
    }
    
    func test_outcome_최고_점수가_아니어도_burst한_게이머들을_제외할때_최고_점수이면_win을_리턴한다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .three)
        lowPointGamer.appendCard(diamond2)
        
        let burstGamer = Gamer(name: "sujin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        burstGamer.appendCard(heartJ)
        burstGamer.appendCard(heartQ)
        burstGamer.appendCard(heartK)
        
        let gamers: [Gamer] = [lowPointGamer, burstGamer]
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: lowPointGamer)
        
        // then
        let expectation: GameResult.OutCome = .win
        XCTAssertEqual(result, expectation)
    }
    
    func test_outcome_burst면_lose을_리턴한다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let burstGamer = Gamer(name: "sujin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        burstGamer.appendCard(heartJ)
        burstGamer.appendCard(heartQ)
        burstGamer.appendCard(heartK)
        
        let highPointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        highPointGamer.appendCard(diamond3)
        
        let gamers: [Gamer] = [burstGamer, highPointGamer]
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: burstGamer)
        
        // then
        let expectation: GameResult.OutCome = .lose
        XCTAssertEqual(result, expectation)
    }
    
    func test_딜러가_burst면_게이머가_burst여도_win을_반환한다() throws {
        // given
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        
        let burstDealer =  Dealer()
        burstDealer.appendCard(heartJ)
        burstDealer.appendCard(heartQ)
        burstDealer.appendCard(heartK)
        
        let burstGamer = Gamer(name: "sujin")
        burstGamer.appendCard(heartJ)
        burstGamer.appendCard(heartQ)
        burstGamer.appendCard(heartK)
        
        let gamers: [Gamer] = [burstGamer]
        
        let sut = GameResult(dealer: burstDealer, gamers: gamers)
        
        // when
        let result = sut.outcome(of: burstGamer)
        
        // then
        let expectation: GameResult.OutCome = .win
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - dealerOutcome
    
    func test_dealerOutcome() throws {
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
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.dealerOutcome
        
        // then
        let expectation = GameResult.DealerOutcome(winningCount: 1,
                                                   drawCount: 1,
                                                   loseCount: 1)
        XCTAssertEqual(result, expectation)
    }
    
    func test_dealerOutcome_딜러가_더_높은_점수를_얻어도_burst_딜러라면_lose로_count한다() throws {
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
        
        let sut = GameResult(dealer: burstDealer, gamers: gamers)
        
        // when
        let result = sut.dealerOutcome
        
        // then
        let expectation = GameResult.DealerOutcome(winningCount: 0,
                                                   drawCount: 0,
                                                   loseCount: 3)
        XCTAssertEqual(result, expectation)
    }
    
    func test_dealerOutcome_게이머가_더_높은_점수를_얻어도_burst_게이머라면_win로_count한다() throws {
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
        
        let sut = GameResult(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.dealerOutcome
        
        // then
        let expectation = GameResult.DealerOutcome(winningCount: 2,
                                                   drawCount: 1,
                                                   loseCount: 0)
        XCTAssertEqual(result, expectation)
    }
    
    func test_dealerOutcome_게이머가_없으면_딜러의_점수도_없다() throws {
        // given
        let dealer = Dealer()
        let heart3 = Card(suit: .heart, denomination: .three)
        dealer.appendCard(heart3)
        
        let sut = GameResult(dealer: dealer, gamers: [])
        
        // when
        let result = sut.dealerOutcome
        
        // then
        let expectation = GameResult.DealerOutcome(winningCount: 0,
                                                   drawCount: 0,
                                                   loseCount: 0)
        XCTAssertEqual(result, expectation)
    }
}
