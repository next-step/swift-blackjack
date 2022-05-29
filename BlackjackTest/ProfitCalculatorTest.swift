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
        
        let dealerProfit = PlusProfit(player: dealer, money: player.bettingMoney)
        let playerProfit = MinusProfit(player: player, money: player.bettingMoney)
        
        let winLoseResults = BlackjackGameJudge().winLoseResults(of: [playerScore], comparingWith: dealerScore)

        // when
        let profits = try ProfitCalculator.calculate(with: winLoseResults)
        
        // then
        XCTAssertEqual(profits.value.filter { $0.player == dealer }.first?.money, dealerProfit.money)
        XCTAssertEqual(profits.value.filter { $0.player == player }.first?.money, playerProfit.money)
    }
    
    func test_딜러와_참가자_둘다_블랙잭일때_참가자는_베팅금액을_돌려받아서_수익이_0이다() throws {
        // given
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck(), bettingMoney: Money(10000)!)
        let blackjackCards = [Card(rank: .ace, suit: .club), Card(rank: .king, suit: .club)]
        
        dealer.receive(cards: blackjackCards)
        player.receive(cards: blackjackCards)
        
        let dealerScore = BlackjackScore(player: dealer, score: dealer.countScore())
        let playerScore = BlackjackScore(player: player, score: player.countScore())
        
        let dealerProfit = ZeroProfit(player: dealer)
        let playerProfit = ZeroProfit(player: player)
        
        let winLoseResults = BlackjackGameJudge().winLoseResults(of: [playerScore], comparingWith: dealerScore)

        // when
        let profits = try ProfitCalculator.calculate(with: winLoseResults)
        
        // then
        XCTAssertEqual(profits.value.filter { $0.player == dealer }.first?.money, dealerProfit.money)
        XCTAssertEqual(profits.value.filter { $0.player == player }.first?.money, playerProfit.money)
    }
    
    func test_딜러가_블랙잭이_아닐때_블랙잭_player는_배팅금액의_일점오배를_수익으로_얻는다() throws {
        // given
        let dealer = Dealer(cardDeck: BlackjackCardDeck())
        let player = Player(name: PlayerName("kim")!, cardDeck: BlackjackCardDeck(), bettingMoney: Money(10000)!)
        
        dealer.receive(cards: [Card(rank: .seven, suit: .club), Card(rank: .seven, suit: .diamond), Card(rank: .seven, suit: .heart)])
        player.receive(cards: [Card(rank: .ace, suit: .club), Card(rank: .king, suit: .club)])
        
        let dealerScore = BlackjackScore(player: dealer, score: dealer.countScore())
        let playerScore = BlackjackScore(player: player, score: player.countScore())
        
        let playerProfit = PlusProfit(player: player, money: player.bettingMoney * 1.5 ?? .zero)
        let dealerProfit = ZeroProfit(player: dealer).minus(playerProfit)
        
        let winLoseResults = BlackjackGameJudge().winLoseResults(of: [playerScore], comparingWith: dealerScore)
        
        // when
        let profits = try ProfitCalculator.calculate(with: winLoseResults)
        
        // then
        XCTAssertEqual(profits.value.filter { $0.player == dealer }.first?.money, dealerProfit.money)
        XCTAssertEqual(profits.value.filter { $0.player == player }.first?.money, playerProfit.money)
    }
}
