//
//  Stay.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/29.
//

import Foundation

struct Stay: Finished {
	var deck: Deck
	let earningRate: Double = 1.0
	
	func profit(bet: Bet, winning: Winning) -> Double {
		changeState(by: winning).profit(bet: bet, winning: winning)
	}
	
	private func changeState(by winning: Winning) -> GameState {
		switch winning {
		case .win: return Win(deck: deck)
		case .push: return Push(deck: deck)
		case .lose: return Lose(deck: deck)
		}
	}
}

