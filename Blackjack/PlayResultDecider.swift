//
//  WinningCalculator.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

enum PlayResultDecider {
	static func decideWinning(of dealer: Dealer, players: [Player]) -> [GameResult] {
		dealer.isBust ? winOfPlayer(players: players, and: dealer) : compete(with: players, and: dealer)
	}
	
	private static func winOfPlayer(players: [Player], and dealer: Dealer) -> [GameResult] {
		let playerResults = players.map { player in
			winOrLose(of: player)
		}
		let dealerProfit = calculateDealerProfit(by: playerResults)
		let dealerResult = [dealer.gameResult(by: dealerProfit)]
		return playerResults + dealerResult
	}
	
	private static func winOrLose(of player: Player) -> GameResult {
		let playerWinning = winOrPushWhenTheDealerIsBust(of: player)
		return player.gameResult(by: playerWinning)
	}
	
	private static func winOrPushWhenTheDealerIsBust(of player: Player) -> Winning {
		if player.isBust { return .push }
		return .win
	}
	
	private static func compete(with players: [Player], and dealer: Dealer) -> [GameResult] {
		let dealerScore = dealer.state.sumOfCardNumbers
		let playerResults = players.map { player in
			winOrLose(of: player, by: dealerScore)
		}
		let dealerProfit = calculateDealerProfit(by: playerResults)
		let dealerResult = [dealer.gameResult(by: dealerProfit)]
		return playerResults + dealerResult
	}
	
	private static func winOrLose(of player: Player, by dealerScore: Int) -> GameResult {
		let playerWinning = compareScore(of: player, and: dealerScore)
		return player.gameResult(by: playerWinning)
	}
	
	private static func compareScore(of player: Player, and dealerScore: Int) -> Winning {
		let playerScore = player.state.sumOfCardNumbers
		if player.isBust || playerScore < dealerScore {
			return .lose
		} else if playerScore > dealerScore {
			return .win
		}
		return .push
	}
	
	private static func winOrLoseOfDealer(by playerWinning: Winning) -> Winning {
		switch playerWinning {
		case .win: return .lose
		case .push: return .push
		case .lose: return .win
		}
	}
	
	private static func calculateDealerProfit(by playerGameResults: [GameResult]) -> Int {
		return playerGameResults
			.map { playerGameResult in
				-(playerGameResult.profit - playerGameResult.bet.amount)
			}.reduce(0) { result, profit in
				result + profit
			}
	}
}

fileprivate extension Player {
	var isBust: Bool {
		self.state.sumOfCardNumbers > BlackjackOption.blackjackNumber
	}
}
