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
	
	enum Suit: CaseIterable {
		case hearts
		case clubs
		case spades
		case diamonds
		
		var description: String {
			switch self {
			case .hearts: return "하트"
			case .clubs: return "클로버"
			case .spades: return "스페이드"
			case .diamonds: return "다이아몬드"
			}
		}
	}
	
	enum Rank: Int, CaseIterable {
		case two = 2, three, four, five, six, seven, eight, nine, ten
		case ace, jack, queen, king
		
		var value: [Int] {
			switch self {
			case .ace:
				return [1, 11]
			case .jack, .queen, .king:
				return [10]
			default:
				return [self.rawValue]
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
	
	var description: String {
		rank.description + suit.description
	}
	
	static func arrangeCards() -> CardPack {
		let cards = Suit.allCases.flatMap { suit in
			makeBlackjackCard(by: suit)
		}
		return CardPack(cards: cards)
	}
	
	private static func makeBlackjackCard(by suit: Suit) -> [BlackjackCard] {
		Rank.allCases.map { rank in
			BlackjackCard(suit: suit, rank: rank)
		}
	}
}
