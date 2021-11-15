//
//  StubResultView.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

final class StubResultView: Presentable {
	var players: [Player]? = nil
	
	enum Verify {
		static var printOutGameStatusBeforePlay = false
		static var printOutDeckOfPlayer = false
	}

	func printOutGameStatusBeforePlay(by players: [Player]) {
		self.players = players
		Verify.printOutGameStatusBeforePlay = true
	}
	
	func printOutDeck(of player: Player) {
		Verify.printOutDeckOfPlayer = true
	}
	
	func clear() {
		players = nil
		Verify.printOutGameStatusBeforePlay = false
		Verify.printOutDeckOfPlayer = false
	}
	
}
