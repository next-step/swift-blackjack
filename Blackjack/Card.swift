//
//  Card.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

struct Card: Hashable {
    let id: CardId
    let symbol: CardSymbol
}

enum CardId: CaseIterable {
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

enum CardSymbol: CaseIterable {
    case heart, spade, diamond, club
}
