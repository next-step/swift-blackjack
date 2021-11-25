//
//  CardScoreCalculator.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/21.
//

import Foundation

enum CardScoreCalculator {
	enum CardResult {
		case bust
		case valid(difference: Int)
	}
	
	static func calculateTheSumOfCardNumbers(in deck: Deck) -> Int {
		let sumOfCardNumbersByTheFirstValue = calculateWithFirstValue(in: deck)
		if hasAceCard(in: deck) {
			return calculateTheBestValueOfTheAceCard(compareTo: sumOfCardNumbersByTheFirstValue, in: deck)
		}
		return sumOfCardNumbersByTheFirstValue
	}
	
	static func calculateWithFirstValue(in deck: Deck) -> Int {
		deck.cards.map { blackjackCard in
			blackjackCard.rank.value[0]
		}.reduce(0) { partialResult, cardRank in
			partialResult + cardRank
		}
	}

	private static func hasAceCard(in deck: Deck) -> Bool {
		deck.cards.filter { card in
			card.rank == .ace
		}.count > 0
	}
	
	private static func calculateTheBestValueOfTheAceCard(compareTo sumOfCardNumbersByTheFirstValue: Int, in deck: Deck) -> Int {
		let sumOfCardNumbersByTheSecondValue = calculateWithSecondValueOfAce(in: deck)
		let differenceWithFirstValue = calculateDifferenceWithBlackjack(sumOfCardNumbers: sumOfCardNumbersByTheFirstValue)
		let differenceWithSecondValue = calculateDifferenceWithBlackjack(sumOfCardNumbers: sumOfCardNumbersByTheSecondValue)
		
		return differenceWithFirstValue > differenceWithSecondValue ? sumOfCardNumbersByTheSecondValue : sumOfCardNumbersByTheFirstValue
	}
	
	private static func calculateDifferenceWithBlackjack(sumOfCardNumbers: Int) -> Int {
		let gameResult = compareBlackjackNumber(and: sumOfCardNumbers)
		
		var differenceWithBlackjack: Int = sumOfCardNumbers
		if case .valid(let difference) = gameResult {
			differenceWithBlackjack = difference
		}
		return differenceWithBlackjack
	}
	
	private static func calculateWithSecondValueOfAce(in deck: Deck) -> Int {
		var isFirstAce = true
		return deck.cards.map { blackjackCard in
			blackjackCard.rank.value
		}.map { rankValues in
			findRank(in: rankValues, isFirstAce: &isFirstAce)
		}.reduce(0) { partialResult, cardRank in
			partialResult + cardRank
		}
	}
	
	private static func findRank(in rankValues: [Int], isFirstAce: inout Bool) -> Int {
		if let secondValue = rankValues[safe: 1], isFirstAce {
			isFirstAce = false
			return secondValue
		}
		return rankValues[0]
	}
	
	private static func compareBlackjackNumber(and number: Int) -> CardResult {
		if number > BlackjackOption.blackjackNumber {
			return CardResult.bust
		}
		return CardResult.valid(difference: BlackjackOption.blackjackNumber - number)
	}
}
