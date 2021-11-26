//
//  BlackjackOption.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

enum BlackjackOption {
	static let blackjackNumber: Int = 21
	static let dealerLimitNumber: Int = 16
	static let numberOfPlayers: ClosedRange<Int> = 1...5
	static let nameRange: ClosedRange<Int> = 1...10
	static let minimumBetAmount: Int = 1000
}
