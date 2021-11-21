//
//  InputView.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

protocol Inputable {
	func askPlayerNames() throws -> InputName
	func askThePlayerWhetherToHit(name: String) throws -> Bool
	func makePlayerName() throws -> InputName
	func makeYesOrNo(name: String) throws -> Bool
}

extension Inputable {
	func askPlayerNames() throws -> InputName {
		let name = try makePlayerName()
		return name
	}
	func askThePlayerWhetherToHit(name: String) throws -> Bool {
		let isWhetherToHit = try makeYesOrNo(name: name)
		return isWhetherToHit
	}
}


protocol PlayerAskable {
	func isInputYes(input: String?) throws -> Bool
}

extension PlayerAskable {
	func isInputYes(input: String?) throws -> Bool {
		guard let validInput = input, validInput.isEmpty == false else { throw BlackjackError.InputError.empty }
		guard ["y", "n"].contains(validInput) else { throw BlackjackError.InputError.outOfRangeInYesOrNo }
		
		return validInput == "y"
	}
}

struct InputView: Inputable, PlayerAskable {
	func makePlayerName() throws -> InputName {
		print("게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
		return try InputName(input: readLine(), numberOfPlayers: BlackjackOption.numberOfPlayers, nameRange: BlackjackOption.nameRange)
	}
	func makeYesOrNo(name: String) throws -> Bool {
		print("\(name)은(는) 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)")
		return try isInputYes(input: readLine())
	}
}
