//
//  StubInputView.swift
//  BlackjackTest
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

final class StubInputView: Inputable {
	let playerNames: String?
	var answerTheHit: [String?]
	var answerTheHitIndex = 0
	var currentName = ""
	
	enum Verify {
		static var moveOnToTheNextPlayerCount = 0
		
		static func clear() {
			Verify.moveOnToTheNextPlayerCount = 0
		}
	}
	
	init(playerNames: String?, answerTheHit: String? ...) {
		self.playerNames = playerNames
		self.answerTheHit = answerTheHit
		appendFalseToTheLastitem()
	}
	
	init(playerNames: String?, answerTheHit: [String?]) {
		self.playerNames = playerNames
		self.answerTheHit = answerTheHit
		appendFalseToTheLastitem()
	}

	func makePlayerName() throws -> InputName {
		try InputName(input: playerNames, numberOfNamesRange: BlackjackOption.numberOfNamesRange, nameRange: BlackjackOption.nameRange)
	}
	
	func makeYesOrNo(name: String) throws -> InputYesOrNo {
		let index = checkToClearHitIndex(by: name)
		let inputYesOrNo = try InputYesOrNo(input: answerTheHit[index])
		answerTheHitIndex += 1
		return inputYesOrNo
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
