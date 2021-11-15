//
//  InputView.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

protocol Inputable {
	func askPlayerNames(completion: (InputName) -> Void) throws
	func askThePlayerWhetherToHit(name: String, completion: (InputYesOrNo) throws -> Void) throws
	func makePlayerName() throws -> InputName
	func makeYesOrNo(name: String) throws -> InputYesOrNo
}

extension Inputable {
	func askPlayerNames(completion: (InputName) -> Void) throws {
		let name = try makePlayerName()
		completion(name)
	}
	func askThePlayerWhetherToHit(name: String, completion: (InputYesOrNo) throws -> Void) throws {
		let isWhetherToHit = try makeYesOrNo(name: name)
		try completion(isWhetherToHit)
	}
}

struct InputView: Inputable {
	func makePlayerName() throws -> InputName {
		print("게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
		return try InputName(input: readLine(), numberOfNamesRange: BlackjackOption.numberOfNames)
	}
	func makeYesOrNo(name: String) throws -> InputYesOrNo {
		print("\(name)은(는) 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)")
		return try InputYesOrNo(input: readLine())
	}
}
