//
//  ResultView.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

protocol Presentable {
	func printOutGameStatusBeforePlay(by players: [Player])
	func printOutDeck(of player: Player)
	func printOutGameResult(by playerGameResults: [GameResult])
	func printOut(error: BlackjackError)
}

struct ResultView: Presentable {
	func printOutGameStatusBeforePlay(by players: [Player]) {
		printOutPlayerNames(players: players)
		printOutEachPlayersOwnCard(players: players)
	}
	
	func printOutDeck(of player: Player) {
		print("\(player.name)카드: \(player.deck.map { $0.description() })")
	}
	
	func printOutGameResult(by playerGameResults: [GameResult]) {
		playerGameResults.forEach { gameResult in
			print("\(gameResult.name)카드: \(convertToLinkedStringByComma(from: gameResult)) - 결과: \(gameResult.sumOfCardNumbers)")
		}
	}
	
	func printOut(error: BlackjackError) {
		guard let errorDescription = error.errorDescription else { return }
		print(errorDescription)
	}
	
	private func convertToLinkedStringByComma(from gameResult: GameResult) -> String {
		gameResult.deck.map { $0.description() }.joined(separator: ",")
	}
	
	private func printOutPlayerNames(players: [Player]) {
		let playerNames = players.map{ $0.name }.joined(separator: ",")
		print("\(playerNames)에게 2장씩 나누었습니다.")
	}
	
	private func printOutEachPlayersOwnCard(players: [Player]) {
		players.forEach { player in
			printOutDeck(of: player)
		}
	}
}
