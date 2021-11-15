//
//  BlackjackError.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

enum BlackjackError: Error {
	enum InputError: Error {
		case empty
		case duplicatedName
		case outOfRangesForNumberOfParticipants
		case outOfRangeInName
	}
	case bust
	case noCard
}
