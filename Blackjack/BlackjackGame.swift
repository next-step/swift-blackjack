//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

class BlackjackGame {
	let dealer: Dealer
	var players: [Player] = [Player]()
	
	init(dealer: Dealer) {
		self.dealer = dealer
	}
	
	func start() {
		let player1 = Player(name: "first", deck: dealer.firstDeal())
		let player2 = Player(name: "second", deck: dealer.firstDeal())
		players = [player1, player2]
	}
}
