//
//  InputYesOrNo.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

struct InputYesOrNo {
	let isYes: Bool
	
	init(input: String?) throws {
		guard let validInput = input else { throw BlackjackError.InputError.empty }
		isYes = validInput == "y"
	}
}
