//
//  WinningCalculator.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

enum PlayResultDecider {
	static func decideWinning(of dealer: Dealer, players: [Player]) -> [GameResult] {
		dealer.isBust ? winOfPlayer(players: players) : compete(with: players, and: dealer)
	}
	
	private static func winOfPlayer(players: [Player]) -> [GameResult] {
		return players.map { player in
			winOrLose(of: player)
		}
	}
	
	private static func winOrLose(of player: Player) -> GameResult {
		if player.isBust {
			return player.gameResult(winning: .lose)
		} else {
			return player.gameResult(winning: .push)
		}
	}
	
	private static func compete(with players: [Player], and dealer: Dealer) -> [GameResult] {
		let dealerScore = dealer.state.sumOfCardNumbers
		return (players + [dealer]).map { player in
			winOrLose(of: player, by: dealerScore)
		}
	}
	
	private static func winOrLose(of player: Player, by dealerScore: Int) -> GameResult {
		let playerScore = player.state.sumOfCardNumbers
		if player.isBust || playerScore < dealerScore {
			return player.gameResult(winning: .lose)
		} else if playerScore > dealerScore {
			return player.gameResult(winning: .win)
		} else {
			return player.gameResult(winning: .push)
		}
	}
	
//	private static func winOrLoseOfDealer(by playerResult: PlayerResult, dealerResult: inout DealerResult) {
//		switch playerResult.winning {
//		case .win: dealerResult.losing()
//		case .push: dealerResult.pushing()
//		case .lose: dealerResult.winning()
//		}
//	}
}

fileprivate extension Player {
	var isBust: Bool {
		self.state.sumOfCardNumbers > BlackjackOption.blackjackNumber
	}
}
