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
	
	mutating func hit(drawnCard: BlackjackCard) throws {
		guard isAvailableHit() else { throw BlackjackError.bust }
		deck.append(drawnCard)
	}
	
	private func isAvailableHit() -> Bool {
		let currentScore = deck.map { blackjackCard in
			blackjackCard.rank.value.first
		}.reduce(0) { partialResult, cardRank in
			partialResult + cardRank
		}
		
		return currentScore < BlackjackOption.blackjackNumber
	}
}
