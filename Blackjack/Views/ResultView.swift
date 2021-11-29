//
//  ResultView.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

protocol Presentable {
	func printOutGameStatusBeforePlay(by playerStates: [PlayerState])
	func printOutDeck(of playerState: PlayerState)
	func printOutGameResult(by playerStates: [PlayerState])
	func printOutWinningResult(by winning: GameResult)
	func printOutTheDealerHit()
	func printOut(error: BlackjackError)
}

struct ResultView: Presentable {
	func printOutGameStatusBeforePlay(by playerStates: [PlayerState]) {
		printOutPlayerNames(playerStates: playerStates)
		printOutEachPlayersOwnCard(playerStates: playerStates)
	}
	
	func printOutDeck(of playerState: PlayerState) {
		print("\(playerState.name)카드: \(playerState.deckDescription)")
	}
	
	func printOutGameResult(by playerStates: [PlayerState]) {
		playerStates.forEach { playerState in
			print("\n\(playerState.name)카드: \(playerState.deckDescription) - 결과: \(playerState.sumOfCardNumbers)")
		}
	}
	
	func printOutWinningResult(by winning: GameResult) {
		print("\n## 최종 승패")
		print("\(winning.dealerResult.description)")
		winning.playerResults.forEach { winningResult in
			print("\(winningResult.description)")
		}
	}
	
	func printOutTheDealerHit() {
		print("\n딜러는 16이하라 한장의 카드를 더 받았습니다.")
	}
	
	func printOut(error: BlackjackError) {
		guard let errorDescription = error.errorDescription else { return }
		print(errorDescription)
	}
	
	private func printOutPlayerNames(playerStates: [PlayerState]) {
		let playerNames = playerStates.map{ $0.name }.joined(separator: ", ")
		print("\n\(playerNames)에게 2장씩 나누었습니다.")
	}
	
	private func printOutEachPlayersOwnCard(playerStates: [PlayerState]) {
		playerStates.forEach { player in
			printOutDeck(of: player)
		}
	}
}
