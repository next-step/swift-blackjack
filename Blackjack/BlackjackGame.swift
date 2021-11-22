//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

final class BlackjackGame {
	private let dealer: Dealer
	private let inputView: Inputable
	private let resultView: Presentable
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
		try playPlayers()
		try playDealer()
	}
	
	private func playPlayers() throws {
		for var player in players {
			do {
				try askThePlayerWhetherToHit(player: &player)
			} catch (let error) {
				if isBustError(on: error) == false { throw error }
			}
		}
	}
	
	private func playDealer() throws {
		if dealer.canHit() == false { return }
		dealer.hit(drawnCard: try dealer.deal())
		resultView.printOutTheDealrHit()
	}
	
	private func gameIsOver() {
		self.printOutGameResult()
		self.printOutWinningResult()
	}
	
	private func dealTheCards() throws {
		let player = try inputView.askPlayerNames()
		startGame(by: player.names)
		resultView.printOutGameStatusBeforePlay(by: self.players)
	}
	
	private func startGame(by names: [String]) {
		names.forEach { name in
			joinTheGame(by: name)
		}
	}
	
	private func joinTheGame(by playerName: String) {
		if let firstCard = try? dealer.deal(),
			 let secondCard = try? dealer.deal() {
			let deck = Deck(cards: [firstCard, secondCard])
			let player = Player(name: playerName, deck: deck)
			players.append(player)
		}
	}
	
	private func askThePlayerWhetherToHit(player: inout Player) throws {
		guard try inputView.askThePlayerWhetherToHit(name: player.name) else { return }
		if player.canHit() == false { throw BlackjackError.bust }
		
		player.hit(drawnCard: try dealer.deal())
		resultView.printOutDeck(of: player)
		try askThePlayerWhetherToHit(player: &player)
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
	
	private func printOutGameResult() {
		let gameResults = players.map { $0.gameResult }
		resultView.printOutGameResult(by: gameResults)
	}
	
	private func printOutWinningResult() {
		let winningResult = WinningCalculator.calculateWinning(dealer: dealer, players: players)
		resultView.printOutWinningResult(by: winningResult)
	}
}
