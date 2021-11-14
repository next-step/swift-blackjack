//
//  Player.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

class Player {
	let name: String
	private(set) var deck: [BlackjackCard]
	var gameResult: GameResult {
		GameResult(name: name, deck: deck, sumOfCardNumbers: calculateTheSumOfCardNumbers())
	}
	
	enum CardResult {
		case bust
		case valid(difference: Int)
	}
	
	init(name: String, deck: [BlackjackCard]) {
		self.name = name
		self.deck = deck
	}
	
	func hit(drawnCard: BlackjackCard) throws {
		guard isAvailableHit() else { throw BlackjackError.bust }
		deck.append(drawnCard)
	}
	
	private func calculateTheSumOfCardNumbers() -> Int {
		let sumOfCardNumbersByTheFirstValue = calculateWithFirstValue()
		if hasAceCard() {
			return calculateTheBestValueOfTheAceCard(compareTo: sumOfCardNumbersByTheFirstValue)
		}
		return sumOfCardNumbersByTheFirstValue
	}
	
	private func hasAceCard() -> Bool {
		deck.filter { card in
			card.rank == .ace
		}.count > 0
	}
	
	private func calculateTheBestValueOfTheAceCard(compareTo sumOfCardNumbersByTheFirstValue: Int) -> Int {
		let sumOfCardNumbersByTheSecondValue = calculateWithSecondValueOfAce()
		let differenceWithFirstValue = calculateDifferenceWithBlackjack(sumOfCardNumbers: sumOfCardNumbersByTheFirstValue)
		let differenceWithSecondValue = calculateDifferenceWithBlackjack(sumOfCardNumbers: sumOfCardNumbersByTheSecondValue)
		
		return differenceWithFirstValue > differenceWithSecondValue ? sumOfCardNumbersByTheSecondValue : sumOfCardNumbersByTheFirstValue
	}
	
	private func calculateDifferenceWithBlackjack(sumOfCardNumbers: Int) -> Int {
		let gameResult = compareBlackjackNumber(and: sumOfCardNumbers)
		
		var differenceWithBlackjack: Int = sumOfCardNumbers
		if case .valid(let difference) = gameResult {
			differenceWithBlackjack = difference
		}
		return differenceWithBlackjack
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
	
	private func compareBlackjackNumber(and number: Int) -> CardResult {
		if number > BlackjackOption.blackjackNumber {
			return CardResult.bust
		}
		return CardResult.valid(difference: BlackjackOption.blackjackNumber - number)
	}
}
