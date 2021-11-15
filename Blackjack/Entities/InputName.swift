//
//  InputName.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

struct InputName {
	let names: [String]
	
	init(input: String?, numberOfNamesRnage: ClosedRange<Int>) throws {
		guard let validInput = input,
					validInput.isEmpty == false
		else { throw BlackjackError.InputError.empty }
		
		self.names = validInput
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.replacingOccurrences(of: " ", with: "")
			.components(separatedBy: ",")
		
		guard Set(names).count == names.count else {
			throw BlackjackError.InputError.duplicatedName
		}
		
		guard numberOfNamesRnage.contains(names.count) else {
			throw BlackjackError.InputError.outOfRangesForNumberOfParticipants
		}
	}
}


