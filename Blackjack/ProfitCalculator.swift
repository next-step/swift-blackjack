//
//  ProfitCalculator.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

struct ProfitCalculator {
    enum Error: LocalizedError {
        case dealerNotExist
        case playerNotExist
        
        var errorDescription: String? {
            switch self {
            case .dealerNotExist:
                return "참가자로 딜러가 존재하지 않습니다."
            case .playerNotExist:
                return "참가자는 2명 이상이어야 합니다."
            }
        }
    }
    static func calculate(with scores: BlackjackScores) throws -> Profits {
        let playerScores = scores.playerScores
        guard let dealerScore = scores.dealerScore else {
            throw Error.playerNotExist
        }
        
        let dealer = dealerScore.player
        let blackjackPlayers = playerScores.map { $0.player }
            .filter { $0.isBlackjack() }
        let nonBlackjackPlayers = playerScores.map { $0.player }
            .filter { $0.isBlackjack() == false }
        
        if dealer.isBlackjack() {
            let zeroProfits = zeroProfits(of: blackjackPlayers)
            let minusProfits = minusProfits(of: nonBlackjackPlayers)
            
            let dealerProfitMoney = sumBettingMoneyOf(players: nonBlackjackPlayers)
            let dealerProfit = PlusProfit(player: dealer, money: dealerProfitMoney)
            
            return Profits(value: [dealerProfit] + zeroProfits + minusProfits)
        }
        
        let nonBlackjackScores = scores.value.filter { nonBlackjackPlayers.contains($0.player) }
        let blackjackProfits = blackjackProfits(of: blackjackPlayers)
        let winLoseResults = BlackjackGameJudge().winLoseResults(of: nonBlackjackScores, comparingWith: dealerScore)
        
        let winPlayers = winLoseResults.playerResults.filter { $0.winCount > $0.loseCount }.map { $0.player }
        let losePlayers = winLoseResults.playerResults.filter { $0.winCount > $0.loseCount }.map { $0.player }
        
        let winPlayersProfit = plusProfits(of: winPlayers)
        let losePlayersProfit = minusProfits(of: losePlayers)
        
        
        let lhs = plusProfits(of: losePlayers).reduce(ZeroProfit(player: dealer) as Profit) { partialResult, profit in
            partialResult.plus(profit)
        }
        
        let rhs = plusProfits(of: winPlayers).reduce(ZeroProfit(player: dealer) as Profit) { partialResult, profit in
            partialResult.plus(profit)
        }
        let sumblackjackProfits = plusProfits(of: blackjackPlayers).reduce(ZeroProfit(player: dealer) as Profit) { partialResult, profit in
            partialResult.plus(profit)
        }
        
        let dealerProfit = lhs.minus(rhs).minus(sumblackjackProfits)
        
        return Profits(value: [dealerProfit] + winPlayersProfit + losePlayersProfit + blackjackProfits)
    }
        
        
    private static func plusProfits(of players: [Player]) -> [Profit] {
        players.map { PlusProfit(player: $0, money: $0.bettingMoney) }
    }
    
    private static func zeroProfits(of players: [Player]) -> [Profit] {
        players.map { player in ZeroProfit(player: player) }
    }
    
    private static func minusProfits(of players: [Player]) -> [Profit] {
        players.map { MinusProfit(player: $0, money: $0.bettingMoney) }
    }
    
    private static func sumBettingMoneyOf(players: [Player]) -> Money {
        players.reduce(Money.zero) { partialResult, player in
            partialResult + player.bettingMoney
        }
    }
    
    private static func blackjackProfits(of players: [Player]) -> [Profit] {
        players.map {
            let money = ($0.bettingMoney * 1.5) ?? Money.zero
            return PlusProfit(player: $0, money: money)
        }
    }
}
