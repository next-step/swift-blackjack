//
//  ProfitCalculatorTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/29.
//

import XCTest

class ProfitCalculatorTest: XCTestCase {
    
    func test_참가자는의_카드점수가_21_초과할경우_베팅금액을_모두_잃는다() throws {
        // given
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        
        let bettingMoney = Money(10000)!
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck(), bettingMoney: bettingMoney)
        player.receive(cards: [Card(rank: .jack, suit: .club), Card(rank: .queen, suit: .club), Card(rank: .king, suit: .club)])
        let players = [dealer, player]
        
        let dealerProfit = Profit(player: dealer, money: bettingMoney)
        let playerProfit = Profit(player: player, money: .zero)
        
        // when
        let profits = try ProfitCalculator.calculate(of: players)
        
        // then
        XCTAssertEqual(profits.value.filter { $0.player == dealer }.first?.money.value, dealerProfit.money.value)
        XCTAssertEqual(profits.value.filter { $0.player == player }.first?.money.value, playerProfit.money.value)
    }
}
