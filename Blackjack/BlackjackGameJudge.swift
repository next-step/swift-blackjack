//
//  BlackjackGameJudge.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

protocol GameJudge {
    func winLoseResult(of score: BlackjackScore, comparingWith counterpartScore: BlackjackScore) -> WinLoseResult
}
struct BlackjackGameJudge: GameJudge {
    func winLoseResult(of score: BlackjackScore, comparingWith counterpartScore: BlackjackScore) -> WinLoseResult {
        let player = score.player
        
        if score.score >= counterpartScore.score {
            return WinLoseResult(player: player, winCount: 1, loseCount: 0)!
        }
        return WinLoseResult(player: player, winCount: 0, loseCount: 1)!
    }
}
