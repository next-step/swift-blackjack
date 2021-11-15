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
			print("\(gameResult.name)카드: \(gameResult.deck.map { $0.description() }) - 결과: \(gameResult.sumOfCardNumbers)")
		}
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
