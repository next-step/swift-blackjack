//
//  PlayerName.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

struct PlayerName {
    private let comma = ","
    let value: String
    
    init?(_ value: String) {
        if value.contains(comma) { return nil }
        self.value = value
    }
}

extension PlayerName: Hashable {}
