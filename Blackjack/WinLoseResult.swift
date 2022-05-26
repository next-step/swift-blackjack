//
//  WinLoseResult.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct WinLoseResult{
    let winCount: Int
    let loseCount: Int
    
    init?(winCount: Int, loseCount: Int) {
        guard winCount > 0, loseCount > 0 else { return nil }
        self.winCount = winCount
        self.loseCount = loseCount
    }
}
