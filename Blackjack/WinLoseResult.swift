//
//  WinLoseResult.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct WinLoseResult {
    let player: Player
    let winCount: Int
    let loseCount: Int
    
    init?(player: Player, winCount: Int, loseCount: Int) {
        guard winCount >= Int.zero, loseCount >= Int.zero else { return nil }
        self.player = player
        self.winCount = winCount
        self.loseCount = loseCount
    }
}

struct WinLoseResults {
    let standardResult: WinLoseResult
    let playerResults: [WinLoseResult]
}
