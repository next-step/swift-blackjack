//
//  Winning.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/24.
//

import Foundation

enum Winning {
	case win
	case push
	case lose
	
	func description(by count: Int) -> String {
		return "\(count)\(self.description)"
	}
	
	var description: String {
		switch self {
		case .win:
			return "승"
		case .push:
			return "무"
		case .lose:
			return "패"
		}
	}
}
