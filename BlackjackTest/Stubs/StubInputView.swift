//
//  StubInputView.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

final class StubInputView: Inputable, PlayerAskable {
	let playerNames: String?
	var betAmounts: [String?]
	var answerTheHit: [String?]
	var answerTheHitIndex = 0
	var betAmountsIndex = 0
	var currentName = ""
	
	enum Verify {
		static var moveOnToTheNextPlayerCount = 0
		
		static func clear() {
			Verify.moveOnToTheNextPlayerCount = 0
		}
	}
	
	init(playerNames: String?, betAmounts: [String?], answerTheHit: String? ...) {
		self.playerNames = playerNames
		self.betAmounts = betAmounts
		self.answerTheHit = answerTheHit
		appendFalseToTheLastitem()
	}
	
	init(playerNames: String?, betAmounts: [String?], answerTheHit: [String?]) {
		self.playerNames = playerNames
		self.betAmounts = betAmounts
		self.answerTheHit = answerTheHit
		appendFalseToTheLastitem()
	}

	func makePlayerName() throws -> InputName {
		try InputName(input: playerNames, numberOfPlayers: BlackjackOption.numberOfPlayers, nameRange: BlackjackOption.nameRange)
	}
	
	func makeBetAmount(by name: String) throws -> PlayerBet {
		let betAmount = try PlayerBet(input: betAmounts[betAmountsIndex])
		betAmountsIndex += 1
		return betAmount
	}
	
	func makeYesOrNo(by name: String) throws -> Bool {
		let index = checkToClearHitIndex(by: name)
		let inputIsYes = try isInputYes(input: answerTheHit[index])
		answerTheHitIndex += 1
		return inputIsYes
	}
	
	private func checkToClearHitIndex(by name: String) -> Int {
		if name != currentName {
			if currentName.isEmpty == false {
				Verify.moveOnToTheNextPlayerCount += 1
			}
			answerTheHitIndex = 0
			currentName = name
		}
		return answerTheHitIndex
	}
	
	private func appendFalseToTheLastitem() {
		if answerTheHit.count > 0 {
			self.answerTheHit.append("n")
		}
	}
}
