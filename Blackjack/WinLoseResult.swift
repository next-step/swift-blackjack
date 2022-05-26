//
//  WinLoseResult.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct WinLoseResult{
    private let zero = 0
    
    let player: Player
    let winCount: Int
    let loseCount: Int
    
    init?(player: Player, winCount: Int, loseCount: Int) {
        guard winCount >= zero, loseCount >= zero else { return nil }
        self.player = player
        self.winCount = winCount
        self.loseCount = loseCount
    }
}
