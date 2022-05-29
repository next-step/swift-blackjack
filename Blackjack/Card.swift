//
//  Card.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

struct Card: Hashable {
    let rank: Rank
    let suit: Suit
    
    enum Rank: CaseIterable {
        case ace
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
    }
    
    enum Suit: CaseIterable {
        case heart, spade, diamond, club
    }
}
