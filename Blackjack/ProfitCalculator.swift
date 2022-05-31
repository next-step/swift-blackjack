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
    
    static func calculate(with winLoseResults: WinLoseResults) throws -> Profits {
        let playerResults = winLoseResults.playerResults
        let players = playerResults.map { $0.player }
        
        let dealerResult = winLoseResults.standardResult
        let dealer = dealerResult.player
        
        if dealer.isBlackjack() {
            return profitWith(blackjackDealer: dealer, players: players)
        }
        return profitWith(nonBlackjackDealer: dealer, using: playerResults)
    }
    
    private static func profitWith(blackjackDealer: Player, players: [Player]) -> Profits {
        let blackjackPlayer = players.filter { $0.isBlackjack() }
        let nonBlackjackPlayer = players.filter { $0.isBlackjack() == false }
        
        let profitsOfBlackjack = zeroProfits(of: blackjackPlayer)
        let profitsOfNonBlackjack = minusProfits(of: nonBlackjackPlayer)
        
      
        let dealerProfit = profitsOfNonBlackjack.reduce(ZeroProfit(player: blackjackDealer) as Profit) { partialResult, profit in
            partialResult.plus(profit)
        }
        
        return Profits(value: [dealerProfit] + profitsOfBlackjack + profitsOfNonBlackjack)
    }
    
    private static func profitWith(nonBlackjackDealer dealer: Player, using playerResults: [WinLoseResult]) -> Profits {
        let blackjackPlayer = playerResults.map { $0.player }
            .filter { $0.isBlackjack() }
        
        let winPlayers = playerResults.filter { $0.winCount > $0.loseCount }
            .map { $0.player }
            .filter { $0.isBlackjack() == false}
        
        let losePlayers = playerResults.filter { $0.winCount < $0.loseCount }.map { $0.player }
        
        let winPlayersProfits = plusProfits(of: winPlayers)
        let losePlayersProfits = minusProfits(of: losePlayers)
        let blackjackPlayersProfit = blackjackProfits(of: blackjackPlayer)
        
        let dealerProfit = ZeroProfit(player: dealer)
            .minus(sum(player: dealer, blackjackPlayersProfit))
            .minus(sum(player: dealer, winPlayersProfits))
            .plus(sum(player: dealer, losePlayersProfits))
        
        return Profits(value: [dealerProfit] + winPlayersProfits + losePlayersProfits + blackjackPlayersProfit)
    }
    
    private static func sum(player: Player, _ profits: [Profit]) -> Profit {
        profits.reduce(ZeroProfit(player: player)) { partialResult, profit in
            partialResult.plus(profit)
        }
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
    
    private static func blackjackProfits(of players: [Player]) -> [Profit] {
        players.map {
            let money = $0.bettingMoney.blackjackWinningMoney()
            return PlusProfit(player: $0, money: money)
        }
    }
}
