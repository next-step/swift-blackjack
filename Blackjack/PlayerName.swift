//
//  PlayerName.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

struct PlayerName {
    let value: String
    
    init?(_ value: String) {
        if value.contains(",") { return nil }
        self.value = value
    }
}
