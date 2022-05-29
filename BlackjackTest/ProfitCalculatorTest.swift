//
//  ProfitCalculatorTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/29.
//

import XCTest

class ProfitCalculatorTest: XCTestCase {
    
    func test_참가자는_베팅금액을_21_초과할경우_베팅금액을_모두_잃는다() {
        // given
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let bettingMoney = Money(10000)
        let firstPlayer = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck(), bettingMoney: bettingMoney)
        
        let dealerScore = BlackjackScore(player: dealer, score: 21)
        let firstScore = BlackjackScore(player: firstPlayer, score: 23)
        let scores = BlackjackScores([dealerScore, firstScore])
        
        let dealerProfit = Profit(player: dealer, value: bettingMoney)
        let playerProfit = Profit(player: player, value: .zero)
        
        // when
        let profits = ProfitCalcultor.calculate(scores: scores)
        
        // then
        XCTAssertEqual(profits.value.filter { $0.player == dealer }.first.profit, dealerProfit)
        XCTAssertEqual(profits.value.filter { $0.player == firstPlayer }.first.profit, playerProfit)
    }
}
