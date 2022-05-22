//
//  Card.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct Card: Equatable, Hashable {
    let suit: Suit
    let denomination: Denomination
    
    var point: Int {
        denomination.point
    }
}
