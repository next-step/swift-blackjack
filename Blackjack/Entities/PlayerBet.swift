//
//  BetAmount.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/26.
//

import Foundation

struct PlayerBet: Bet {
	let amount: Int
	
	init(input: String?) throws {
		guard let validInput = input,
					let amount = Int(validInput)
		else { throw BlackjackError.InputError.invalid }
		
		self.amount = amount
	}
}
