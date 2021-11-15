//
//  InputName.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/15.
//

import Foundation

struct InputName {
	let names: [String]
	
	init(input: String?, numberOfNamesRange: ClosedRange<Int>, nameRange: ClosedRange<Int>) throws {
		guard let validInput = input,
					validInput.isEmpty == false
		else { throw BlackjackError.InputError.empty }
		
		self.names = validInput.splitTrimedStringByComma()
		try self.names.checkValidNames(in: numberOfNamesRange, nameRange: nameRange)
	}
}

fileprivate extension String {
	func splitTrimedStringByComma() -> [String] {
		self.replacingOccurrences(of: " ", with: "")
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.components(separatedBy: ",")
	}
}

fileprivate extension Array where Element == String {
	func checkValidNames(in numberOfNamesRange: ClosedRange<Int>, nameRange: ClosedRange<Int>) throws {
		guard Set(self).count == self.count else {
			throw BlackjackError.InputError.duplicatedName
		}
		
		guard numberOfNamesRange.contains(self.count) else {
			throw BlackjackError.InputError.outOfRangesForNumberOfParticipants
		}
		
		guard self.filter({ nameRange.contains($0.count) }).count == self.count else {
			throw BlackjackError.InputError.outOfRangeInName
		}
	}
}

