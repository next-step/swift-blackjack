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
        
        let isDealerBlackjack = dealerScore.score == BlackjackScoreRule.twentyOne && dealerScore.player.cardDeck.cards.count == 2
        
        let dealer = dealerScore.player
        let blackjackPlayers = playerScores.map { $0.player }
            .filter { $0.countScore() == BlackjackScoreRule.twentyOne && $0.cardDeck.cards.count == 2 }
        let nonBlackjackPlayers = playerScores.map { $0.player }
            .filter { $0.countScore() != BlackjackScoreRule.twentyOne || $0.cardDeck.cards.count != 2 }
        
//        if isDealerBlackjack {
            let zeroProfits = blackjackPlayers.map { player in
                ZeroProfit(player: player)
            }
            
            let minusProfits = nonBlackjackPlayers.map { MinusProfit(player: $0, money: $0.bettingMoney) }
            let dealerProfitMoney = nonBlackjackPlayers.reduce(Money.zero) { partialResult, player in
                partialResult + player.bettingMoney
            }
            let dealerProfit = PlusProfit(player: dealer, money: dealerProfitMoney)
            
            return Profits(value: [dealerProfit] + zeroProfits + minusProfits)
//        }
        
    }
}
