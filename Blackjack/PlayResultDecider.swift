//
//  WinningCalculator.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

enum PlayResultDecider {
	static func decideWinning(of dealer: Dealer, players: [Player]) -> PlayResult {
		dealer.isBust ? winOfPlayer(by: dealer, players: players) : compete(with: players, and: dealer)
	}
	
	private static func winOfPlayer(by bustedDealer: Dealer, players: [Player]) -> PlayResult {
		var dealerResult = DealerResult(name: bustedDealer.name)
		let playerResults = players.map { player -> PlayerResult in
			let playerResult = winOrLose(of: player, dealerResult: &dealerResult)
			winOrLoseOfDealer(by: playerResult, dealerResult: &dealerResult)
			return playerResult
		}
		return PlayResult(dealerResult: dealerResult, playerResults: playerResults)
	}
	
	private static func winOrLose(of player: Player, dealerResult: inout DealerResult) -> PlayerResult {
		if player.isBust {
			return PlayerResult(name: player.name, winning: .push)
		} else {
			return PlayerResult(name: player.name, winning: .win)
		}
	}
	
	private static func compete(with players: [Player], and dealer: Dealer) -> PlayResult {
		var dealerResult = DealerResult(name: dealer.name)
		let dealerScore = dealer.gameResult.sumOfCardNumbers
		let playerResults = players.map { player -> PlayerResult in
			let playerResult = winOrLose(of: player, by: dealerScore, dealerResult: &dealerResult)
			winOrLoseOfDealer(by: playerResult, dealerResult: &dealerResult)
			return playerResult
		}
		return PlayResult(dealerResult: dealerResult, playerResults: playerResults)
	}
	
	private static func winOrLose(of player: Player, by dealerScore: Int, dealerResult: inout DealerResult) -> PlayerResult {
		let playerScore = player.gameResult.sumOfCardNumbers
		if player.isBust || playerScore < dealerScore {
			return PlayerResult(name: player.name, winning: .lose)
		} else if playerScore > dealerScore {
			return PlayerResult(name: player.name, winning: .win)
		} else {
			return PlayerResult(name: player.name, winning: .push)
		}
	}
	
	private static func winOrLoseOfDealer(by playerResult: PlayerResult, dealerResult: inout DealerResult) {
		switch playerResult.winning {
		case .win: dealerResult.losing()
		case .push: dealerResult.drawing()
		case .lose: dealerResult.winning()
		}
	}
}

fileprivate extension Player {
	var isBust: Bool {
		self.gameResult.sumOfCardNumbers > BlackjackOption.blackjackNumber
	}
}
