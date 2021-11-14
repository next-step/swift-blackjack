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
	var players: [Player] = [Player]()
	
	init(dealer: Dealer, inputable: Inputable) {
		self.dealer = dealer
		self.inputView = inputable
	}
	
	func start() throws {
		try dealTheCards()
		try deal()
		gameIsOver()
	}
	
	private func deal() throws {
		for var player in players {
			try askThePlayerWhetherToHit(player: &player)
		}
	}
	
	func gameIsOver() {
		
	}
	
	private func dealTheCards() throws {
		try inputView.askPlayerNames { player in
			makePlayers(by: player.names)
		}
	}
	
	private func makePlayers(by names: [String]) {
		names.forEach { name in
			if let drawnCard = dealer.firstDeal() {
				let player = Player(name: name, deck: drawnCard)
				players.append(player)
			}
		}
	}
	
	private func askThePlayerWhetherToHit(player: inout Player) throws {
		try inputView.askThePlayerWhetherToHit(name: player.name) { input in
			guard input.isYes else { return }
			
			try player.hit(drawnCard: dealer.deal())
			try askThePlayerWhetherToHit(player: &player)
		}
	}
}
