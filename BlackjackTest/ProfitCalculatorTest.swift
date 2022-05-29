//
//  ProfitCalculatorTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/29.
//

import XCTest

class ProfitCalculatorTest: XCTestCase {
    
    func test_딜러만_블랙잭일때_참가자들은_베팅금액을_모두_잃는다() throws {
        // given
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck(), bettingMoney: Money(10000)!)
        player.receive(cards: [Card(rank: .jack, suit: .club), Card(rank: .queen, suit: .club), Card(rank: .king, suit: .club)])
        
        dealer.receive(cards: [Card(rank: .ace, suit: .club), Card(rank: .king, suit: .club)])
        player.receive(cards: [Card(rank: .seven, suit: .club), Card(rank: .seven, suit: .diamond), Card(rank: .seven, suit: .heart)])
        
        let dealerScore = BlackjackScore(player: dealer, score: dealer.countScore())
        let playerScore = BlackjackScore(player: player, score: player.countScore())
        let scores = BlackjackScores([dealerScore, playerScore])
        
        let dealerProfit = PlusProfit(player: dealer, money: player.bettingMoney)
        let playerProfit = MinusProfit(player: player, money: player.bettingMoney)
        
        // when
        let profits = try ProfitCalculator.calculate(with: scores)
        
        // then
        
        XCTAssertEqual(profits.value.filter { $0.player == dealer }.first?.money, dealerProfit.money)
        XCTAssertEqual(profits.value.filter { $0.player == player }.first?.money, playerProfit.money)
    }
}
