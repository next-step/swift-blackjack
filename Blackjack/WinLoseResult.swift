//
//  WinLoseResult.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct WinLoseResult{
    private let zero = 0
    
    let winCount: Int
    let loseCount: Int
    
    init?(winCount: Int, loseCount: Int) {
        guard winCount > zero, loseCount > zero else { return nil }
        self.winCount = winCount
        self.loseCount = loseCount
    }
}
