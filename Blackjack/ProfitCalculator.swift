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
    static func calculate(of player: [Player]) throws -> Profits {
        guard player.count >= 2 else {
            throw Error.playerNotExist
        }
        guard let dealer = player.filter({ $0 is Dealer }).first else {
            throw Error.dealerNotExist
        }
        
        let players = player.filter { ($0 is Dealer) == false }
        let blackjackPlayers = players.filter { $0.cardDeck.cards.count == 2 && $0.cardDeck.countScore() == BlackjackScoreRule.twentyOne }
        let nonBlackjackPlayers =  players.filter { $0.cardDeck.cards.count != 2 || $0.cardDeck.countScore() != BlackjackScoreRule.twentyOne }
        
        // 딜러가 블랙잭 && 플레이어가 블랙잭
        if dealer.cardDeck.cards.count == 2 && dealer.countScore() == BlackjackScoreRule.twentyOne
            && blackjackPlayers.isNotEmpty {
            let dealerProfit = Profit(player: dealer, money: .zero)
            
            let playersProfit = players.map { Profit(player: $0, money: $0.bettingMoney) }
            return Profits(value: [dealerProfit] + playersProfit)
        }
        
        // 딜러만 블랙잭
        if dealer.cardDeck.cards.count == 2 && dealer.countScore() == BlackjackScoreRule.twentyOne
            && blackjackPlayers.isEmpty{
            let sumBettingMoney = players.reduce(Money.zero) { partialResult, player in
                partialResult + player.bettingMoney
            }
            let dealerProfit = Profit(player: dealer, money: sumBettingMoney)
            let playersProfit = players.map { Profit(player: $0, money: .zero) }
            return Profits(value: [dealerProfit] + playersProfit)
        }
        
        // 플레이어만 블랙잭
        if (dealer.cardDeck.cards.count == 2 && dealer.countScore() == BlackjackScoreRule.twentyOne) == false
            && blackjackPlayers.isNotEmpty {
            let dealerProfit = Profit(player: dealer, money: .zero)
            let winPlayerProfit = blackjackPlayers.map { Profit(player: $0, money: Money(Int(Double($0.bettingMoney.value) * 1.5))!) }
            let losePlayerProfit = nonBlackjackPlayers.map { Profit(player: $0, money: .zero) }
            return Profits(value: [dealerProfit] +  winPlayerProfit + losePlayerProfit)
            
        }
        
        // 딜러가 21을 초과하면 그 시점까지 남아 있던 플레이어들은 가지고 있는 패에 상관 없이 승리하여 베팅 금액을 받습니다.
        if dealer.cardDeck.countScore() > BlackjackScoreRule.twentyOne {
            let dealerProfit = Profit(player: dealer, money: .zero)
            let playersProfit = players.map { Profit(player: $0, money: $0.bettingMoney) }
            return Profits(value: [dealerProfit] + playersProfit)
        }
        
        // 딜러, 플레이어 둘다 블랙잭이 아닌 경우
        let dealerScore = BlackjackScore(player: dealer, score: dealer.countScore())
        let scores = players.map { BlackjackScore(player: $0, score: $0.countScore()) }
        let winLoseResults = BlackjackGameJudge().winLoseResults(of: scores, comparingWith: dealerScore)
        let winResults = winLoseResults.playerResults.filter { $0.winCount > $0.loseCount }
        let loseResults = winLoseResults.playerResults.filter { $0.winCount < $0.loseCount }
        
        let winProfits = winResults.map { Profit(player: $0.player, money: $0.player.bettingMoney) }
        let loseProfits = loseResults.map { Profit(player: $0.player, money: .zero) }
        let sumLoseBettingMoney = loseResults.reduce(Money.zero) { partialResult, result in
            partialResult + result.player.bettingMoney
        }
        let dealerProfit = Profit(player: dealer, money: sumLoseBettingMoney)
        return Profits(value: [dealerProfit] + winProfits + loseProfits)
    }
}
