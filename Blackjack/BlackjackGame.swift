//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

class BlackjackGame {
	let dealer: Dealer
	let inputView: Inputable
	let resultView: Presentable
	var players: [Player] = [Player]()
	
	init(dealer: Dealer, inputable: Inputable, presentable: Presentable) {
		self.dealer = dealer
		self.inputView = inputable
		self.resultView = presentable
	}
	
	func start() {
		do {
			try dealTheCards()
			try playGame()
			gameIsOver()
		} catch (let error) {
			printOutErrorOnResultView(error: error)
		}
	}
	
	private func playGame() throws {
		for var player in players {
			do {
				try askThePlayerWhetherToHit(player: &player)
			} catch (let error) {
				if isBustError(on: error) == false { throw error }
			}
		}
	}
	
	func gameIsOver() {
		let gameResults = players.map { $0.gameResult }
		resultView.printOutGameResult(by: gameResults)
	}
	
	private func dealTheCards() throws {
		try inputView.askPlayerNames { player in
			startGame(by: player.names)
		}
		resultView.printOutGameStatusBeforePlay(by: self.players)
	}
	
	private func startGame(by names: [String]) {
		names.forEach { name in
			joinTheGame(by: name)
		}
	}
	
	private func joinTheGame(by playerName: String) {
		if let drawnCard = dealer.firstDeal() {
			let player = Player(name: playerName, deck: drawnCard)
			players.append(player)
		}
	}
	
	private func askThePlayerWhetherToHit(player: inout Player) throws {
		try inputView.askThePlayerWhetherToHit(name: player.name) { input in
			guard input.isYes else { return }
			
			try player.hit(drawnCard: dealer.deal())
			resultView.printOutDeck(of: player)
			try askThePlayerWhetherToHit(player: &player)
		}
	}
	
	private func printOutErrorOnResultView(error: Error) {
		if let inputError = error as? BlackjackError.InputError {
			resultView.printOut(error: .input(inputError))
		}
		
		if let blackjackError = error as? BlackjackError {
			resultView.printOut(error: blackjackError)
		}
	}
	
	private func isBustError(on thrownError: Error) -> Bool {
		if let error = thrownError as? BlackjackError, error == .bust {
			printOutErrorOnResultView(error: error)
			return true
		}
		return false
	}
}
