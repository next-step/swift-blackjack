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
			print("\(gameResult.name)카드: \(gameResult.deck.map { $0.description() }) - 결과: \(gameResult.sumOfCardNumbers)")
		}
	}
	
	func printOut(error: BlackjackError) {
		switch error {
		case .input(.empty):
			print("빈 값은 입력이 불가능합니다.")
		case .input(.outOfRangeInName):
			print("참여자의 이름은 1~10자리만 가능합니다.")
		case .input(.outOfRangesForNumberOfParticipants):
			print("참여자 수는 2~5명만 가능합니다.")
		case .input(.duplicatedName):
			print("참여자 이름은 중복이 불가능합니다.")
		case .input(.outOfRangeInYesOrNo):
			print("추가 카드 요청은 `y`, `n`만 입력이 가능합니다.")
		case .bust:
			print("버스트에서는 카드 추가 요청이 불가능합니다.")
		case .noCard:
			print("더 이상 카드가 존재하지 않습니다.")
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
