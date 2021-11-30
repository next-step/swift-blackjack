//
//  StubResultView.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

final class StubResultView: Presentable {
	var hitCount = [Int]()
	var playerResults = [PlayerState]()
	var error: BlackjackError? = nil
	var gameResults: [GameResult] = [GameResult]()
	var playerStates: [PlayerState] = [PlayerState]()
	private var playerIndex = 0
	
	enum Verify {
		static var printOutGameStatusBeforePlay = false
		static var printOutDeckOfPlayer = false
		static var printOutGameResult = false
		static var printOutWinningResult = false
		static var printOutTheDealerHit = false
		static var printOutError = false
	}

	func printOutGameStatusBeforePlay(by playerStates: [PlayerState]) {
		self.playerStates = playerStates
		self.hitCount = (0...playerStates.count - 1).map { _ in 0 }
		Verify.printOutGameStatusBeforePlay = true
	}
	
	func printOutDeck(of playerState: PlayerState) {
		if playerStates[playerIndex].name != playerState.name {
			playerIndex += 1
		}
		hitCount[playerIndex] += 1
		Verify.printOutDeckOfPlayer = true
	}
	
	func printOutTheDealerHit() {
		Verify.printOutTheDealerHit = true
	}
	
	func printOut(error: BlackjackError) {
		self.error = error
		Verify.printOutError = true
	}
	
	func printOutGameResult(by playerStates: [PlayerState]) {
		self.playerResults = playerStates
		Verify.printOutGameResult = true
	}
	
	func printOutWinningResult(by winning: [GameResult]) {
		self.gameResults = winning
		Verify.printOutWinningResult = true
	}
	
	func clear() {
		playerStates = [PlayerState]()
		playerResults = [PlayerState]()
		hitCount = [Int]()
		playerIndex = 0
		error = nil
		Verify.printOutGameStatusBeforePlay = false
		Verify.printOutDeckOfPlayer = false
		Verify.printOutGameResult = false
		Verify.printOutWinningResult = false
		Verify.printOutTheDealerHit = false
		Verify.printOutError = false
	}
	
}
