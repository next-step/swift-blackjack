//
//  WinningCalculator.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

enum WinningCalculator {
	static func calculateWinning(dealer: Dealer, players: [Player]) -> Winning {
		dealer.isBust ? winOfPlayer(by: dealer, players: players) : winOrLose(of: players, by: dealer)
	}
	
	private static func winOfPlayer(by bustedDealer: Dealer, players: [Player]) -> Winning {
		var dealerResult = DealerResult(name: bustedDealer.name)
		let playerResults = players.map { player in
			winOrLose(of: player, dealerResult: &dealerResult)
		}
		return Winning(dealerResult: dealerResult, playerResults: playerResults)
	}
	
	private static func winOrLose(of player: Player, dealerResult: inout DealerResult) -> PlayerResult {
		if player.isBust {
			dealerResult.drawing()
			return PlayerResult(name: player.name, winning: .draw)
		} else {
			dealerResult.losing()
			return PlayerResult(name: player.name, winning: .win)
		}
	}
	
	private static func winOrLose(of players: [Player], by dealer: Dealer) -> Winning {
		var dealerResult = DealerResult(name: dealer.name)
		let dealerScore = dealer.gameResult.sumOfCardNumbers
		let playerResults = players.map { player -> PlayerResult in
			winOrLose(of: player, dealerScore: dealerScore, dealerResult: &dealerResult)
		}
		return Winning(dealerResult: dealerResult, playerResults: playerResults)
	}
	
	private static func winOrLose(of player: Player, dealerScore: Int, dealerResult: inout DealerResult) -> PlayerResult {
		let playerScore = player.gameResult.sumOfCardNumbers
		if player.isBust || playerScore < dealerScore {
			dealerResult.winning()
			return PlayerResult(name: player.name, winning: .lose)
		} else if playerScore > dealerScore {
			dealerResult.losing()
			return PlayerResult(name: player.name, winning: .win)
		} else {
			dealerResult.drawing()
			return PlayerResult(name: player.name, winning: .draw)
		}
	}
}

fileprivate extension Player {
	var isBust: Bool {
		self.gameResult.sumOfCardNumbers > BlackjackOption.blackjackNumber
	}
}
