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
	private(set) var drawingCount: Int = 0
	private(set) var losingCount: Int = 0
	
	init(name: String) {
		self.name = name
	}
	
	mutating func winning() {
		winningCount += 1
	}
	
	mutating func drawing() {
		drawingCount += 1
	}
	
	mutating func losing() {
		losingCount += 1
	}
	
	var description: String {
		var description = ["\(name):"]
		if winningCount > 0 { description.append("\(winningCount)승") }
		if drawingCount > 0 { description.append("\(drawingCount)무") }
		if losingCount > 0 { description.append("\(losingCount)패") }
		return description.joined(separator: " ")
	}
}

