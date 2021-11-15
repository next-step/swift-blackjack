//
//  BlackjackError.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

enum BlackjackError: Error, Equatable {
	enum InputError: Error {
		case empty
		case duplicatedName
		case outOfRangesForNumberOfParticipants
		case outOfRangeInName
		case outOfRangeInYesOrNo
	}
	case bust
	case noCard
	case input(InputError)
}
