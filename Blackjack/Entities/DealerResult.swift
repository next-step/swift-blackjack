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
}

