//
//  BlackjackCard.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/13.
//

import Foundation

struct BlackjackCard: Hashable {
	let suit: Suit
	let rank: Rank
	
	enum Suit: String, CaseIterable {
		case hearts = "하트"
		case clubs = "클로버"
		case spades = "스페이드"
		case diamonds = "다이아몬드"
	}
	
	enum Rank: Int, CaseIterable {
		typealias Values = (first: Int, second: Int?)
		
		case two = 2, three, four, five, six, seven, eight, nine, ten
		case ace, jack, queen, king
		
		var value: Values {
			switch self {
			case .ace:
				return Values(first: 1, second: 11)
			case .jack, .queen, .king:
				return Values(first: 10, second: nil)
			default:
				return Values(first: self.rawValue, second: nil)
			}
		}
		
		var description: String {
			switch self {
			case .ace: return "A"
			case .jack: return "J"
			case .queen: return "Q"
			case .king: return "K"
			default: return String(describing: self.rawValue)
			}
		}
	}
	
	init(suit: Suit, rank: Rank) {
		self.suit = suit
		self.rank = rank
	}
	
	func description() -> String {
		rank.description + suit.rawValue
	}
	
	static func arrangeCards() -> [BlackjackCard] {
		Suit.allCases.flatMap { suit in
			makeBlackjackCard(by: suit)
		}
	}
	
	private static func makeBlackjackCard(by suit: Suit) -> [BlackjackCard] {
		Rank.allCases.map { rank in
			BlackjackCard(suit: suit, rank: rank)
		}
	}
}
