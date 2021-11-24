//
//  Winning.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/24.
//

import Foundation

enum Winning: String {
	case win = "승"
	case push = "무"
	case lose = "패"
	
	func description(by count: Int) -> String {
		"\(count)\(self.rawValue)"
	}
}
