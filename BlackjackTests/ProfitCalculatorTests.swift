//
//  ProfitCalculatorTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/28.
//

import XCTest

class ProfitCalculatorTests: XCTestCase {
    
    // MARK: - calculateProfit
    
    func test_calculateProfit_블랙잭이_아닌_유일한_최고_점수이면_베팅_금액만큼_얻는다() throws {
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
        
        let highPointGamerBettingMoney: Double = 10
        highPointGamer.bettingMoney = highPointGamerBettingMoney
        
        let gamers: [Gamer] = [lowPointGamer, highPointGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: highPointGamer)
        
        // then
        let expectation = highPointGamerBettingMoney
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_동률이_있는_최고_점수를_얻었을때_그_사람이_딜러이면_아무_금액도_얻지_않는다() throws {
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
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: highPointGamer)
        
        // then
        let expectation: Double = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_동률이_있는_최고_점수를_얻었을때_그_사람이_딜러가_아니면_베팅한_금액만큼_얻는다() throws {
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
        
        let samePointGamer2BettingMoney: Double = 10
        samePointGamer2.bettingMoney = samePointGamer2BettingMoney
        
        let gamers: [Gamer] = [samePointGamer1, samePointGamer2]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: samePointGamer2)
        
        // then
        let expectation = samePointGamer2BettingMoney
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_카드_두장으로_블랙잭이_되었을때_딜러와_동률이_아니라면_베팅_금액의_1_점_5배를_얻는다() throws {
        // given
        let dealer = Dealer()
        let heartAce = Card(suit: .heart, denomination: .ace)
        dealer.appendCard(heartAce)
        
        let blackjackAtFirstGamer = Gamer(name: "naljin")
        let diamondAce = Card(suit: .diamond, denomination: .ace)
        let diamondKing = Card(suit: .diamond, denomination: .king)
        blackjackAtFirstGamer.appendCard(diamondAce)
        blackjackAtFirstGamer.appendCard(diamondKing)
        
        let blackjackAtFirstGamerBettingMoney: Double = 10
        blackjackAtFirstGamer.bettingMoney = blackjackAtFirstGamerBettingMoney
        
        let gamers: [Gamer] = [blackjackAtFirstGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: blackjackAtFirstGamer)
        
        // then
        let expectation: Double = blackjackAtFirstGamerBettingMoney * 1.5
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_카드_두장으로_블랙잭이_되었을때_딜러와_동률이라면_아무_금액도_얻지_않는다() throws {
        // given
        let dealer = Dealer()
        let heartAce = Card(suit: .heart, denomination: .ace)
        let heartKing = Card(suit: .heart, denomination: .king)
        dealer.appendCard(heartAce)
        dealer.appendCard(heartKing)
        
        let blackjackAtFirstGamer = Gamer(name: "naljin")
        let diamondAce = Card(suit: .diamond, denomination: .ace)
        let diamondKing = Card(suit: .diamond, denomination: .king)
        blackjackAtFirstGamer.appendCard(diamondAce)
        blackjackAtFirstGamer.appendCard(diamondKing)
        
        let gamers: [Gamer] = [blackjackAtFirstGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: blackjackAtFirstGamer)
        
        // then
        let expectation: Double = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_최고_점수가_아니면_베팅한_금액만큼_잃는다() throws {
        // given
        let dealer = Dealer()
        let heartAce = Card(suit: .heart, denomination: .ace)
        let heartKing = Card(suit: .heart, denomination: .king)
        dealer.appendCard(heartAce)
        dealer.appendCard(heartKing)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        lowPointGamer.appendCard(diamond2)
        
        let lowPointGamerBettingMoney: Double = 10
        lowPointGamer.bettingMoney = lowPointGamerBettingMoney
        
        let highPointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        highPointGamer.appendCard(diamond3)
        
        let gamers: [Gamer] = [lowPointGamer, highPointGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: lowPointGamer)
        
        // then
        let expectation = -lowPointGamerBettingMoney
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_최고_점수가_아니어도_burst한_게이머들을_제외할때_최고_점수이면_베팅한_금액만큼_얻는다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let lowPointGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .three)
        lowPointGamer.appendCard(diamond2)
        
        let lowPointGamerBettingMoney: Double = 10
        lowPointGamer.bettingMoney = lowPointGamerBettingMoney
        
        let burstGamer = Gamer(name: "sujin")
        let heartJ = Card(suit: .heart, denomination: .jack)
        let heartQ = Card(suit: .heart, denomination: .queen)
        let heartK = Card(suit: .heart, denomination: .king)
        burstGamer.appendCard(heartJ)
        burstGamer.appendCard(heartQ)
        burstGamer.appendCard(heartK)
        
        let gamers: [Gamer] = [lowPointGamer, burstGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: lowPointGamer)
        
        // then
        let expectation = lowPointGamerBettingMoney
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_burst면_베팅한_금액만큼_잃는다() throws {
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
        
        let burstGamerBettingMoney: Double = 10
        burstGamer.bettingMoney = burstGamerBettingMoney
        
        let highPointGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        highPointGamer.appendCard(diamond3)
        
        let gamers: [Gamer] = [burstGamer, highPointGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: burstGamer)
        
        // then
        let expectation = -burstGamerBettingMoney
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculateProfit_딜러가_burst면_게이머가_burst여도_베팅한_금액만큼_얻는다() throws {
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
        
        let burstGamerBettingMoney: Double = 10
        burstGamer.bettingMoney = burstGamerBettingMoney
        
        let gamers: [Gamer] = [burstGamer]
        
        let sut = ProfitCalculator(dealer: burstDealer, gamers: gamers)
        
        // when
        let result = sut.calculateProfit(of: burstGamer)
        
        // then
        let expectation = burstGamerBettingMoney
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - calculateDealerProfit
    
    func test_calculateDealerProfit_유저가_얻은만큼_딜러는_잃는다() throws {
        // given
        let dealer = Dealer()
        let heart2 = Card(suit: .heart, denomination: .two)
        dealer.appendCard(heart2)
        
        let loseGamer = Gamer(name: "sujin")
        let diamond2 = Card(suit: .diamond, denomination: .two)
        loseGamer.appendCard(diamond2)
        let loseGamerBettingMoney: Double = 10
        loseGamer.bettingMoney = loseGamerBettingMoney
        
        let winGamer = Gamer(name: "naljin")
        let diamond3 = Card(suit: .diamond, denomination: .three)
        winGamer.appendCard(diamond3)
        let winGamerBettingMoney: Double = 20
        winGamer.bettingMoney = winGamerBettingMoney
        
        let gamers: [Gamer] = [loseGamer, winGamer]
        
        let sut = ProfitCalculator(dealer: dealer, gamers: gamers)
        
        // when
        let result = sut.calculateDealerProfit()
        
        // then
        let expectation: Double = -10
        XCTAssertEqual(result, expectation)
    }
}
