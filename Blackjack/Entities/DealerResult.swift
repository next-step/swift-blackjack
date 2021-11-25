//
//  DealerResult.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/22.
//

import Foundation

struct DealerResult {
	let name: String
	private(set) var winningCount: Int = 0
	private(set) var pushingCount: Int = 0
	private(set) var losingCount: Int = 0
	
	init(name: String) {
		self.name = name
	}
	
	mutating func winning() {
		winningCount += 1
	}
	
	mutating func pushing() {
		pushingCount += 1
	}
	
	mutating func losing() {
		losingCount += 1
	}
	
	var description: String {
		var description = ["\(name):"]
		if winningCount > 0 { description.append(Winning.win.description(by: winningCount)) }
		if pushingCount > 0 { description.append(Winning.push.description(by: pushingCount)) }
		if losingCount > 0 { description.append(Winning.lose.description(by: losingCount)) }
		return description.joined(separator: " ")
	}
}

