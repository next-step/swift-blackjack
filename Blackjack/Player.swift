//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

struct Player {
	let name: String
	private(set) var deck: [BlackjackCard]
	
	enum GameResult {
		case bust
		case valid(difference: Int)
	}
	
	mutating func hit(drawnCard: BlackjackCard) throws {
		guard isAvailableHit() else { throw BlackjackError.bust }
		deck.append(drawnCard)
	}
	
	func calculateTheSumOfCardNumbers() -> Int {
		let calculatedByTheSecondValueOfAce = calculateWithSecondValueOfAce()
		let calculatedByTheFirstValue = calculateWithFirstValue()
		let resultCalculatedByTheSecondValueOfAce = compareBlackjackNumber(and: calculatedByTheSecondValueOfAce)
		let resultCalculatedByTheFirstValue = compareBlackjackNumber(and: calculatedByTheFirstValue)
		
		var differenceBySecondValueOfAce: Int = calculatedByTheSecondValueOfAce
		if case .valid(let difference) = resultCalculatedByTheSecondValueOfAce {
			differenceBySecondValueOfAce = difference
		}
		
		var differenceByFirstValue: Int = calculatedByTheFirstValue
		if case .valid(let difference) = resultCalculatedByTheFirstValue {
			differenceByFirstValue = difference
		}
		
		return differenceByFirstValue > differenceBySecondValueOfAce ? calculatedByTheSecondValueOfAce : calculatedByTheFirstValue
	}
	
	private func calculateWithSecondValueOfAce() -> Int {
		var isFirstAce = true
		return deck.map { blackjackCard in
			blackjackCard.rank.value
		}.map { rank in
			if let secondValue = rank.second, isFirstAce {
				isFirstAce = false
				return secondValue
			} else {
				return rank.first
			}
		}.reduce(0) { partialResult, cardRank in
			partialResult + cardRank
		}
	}
	
	private func isAvailableHit() -> Bool {
		let sumOfCardNumbers = calculateWithFirstValue()
		return sumOfCardNumbers < BlackjackOption.blackjackNumber
	}
	
	private func calculateWithFirstValue() -> Int {
		deck.map { blackjackCard in
			blackjackCard.rank.value.first
		}.reduce(0) { partialResult, cardRank in
			partialResult + cardRank
		}
	}
	
	private func compareBlackjackNumber(and number: Int) -> GameResult {
		if number > BlackjackOption.blackjackNumber {
			return GameResult.bust
		}
		return GameResult.valid(difference: BlackjackOption.blackjackNumber - number)
	}
}
