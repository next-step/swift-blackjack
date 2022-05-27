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
    func winLoseResults(with scores: [BlackjackScore], comparingWith counterpartScore: BlackjackScore) -> WinLoseResults {
        let winLoseResults = scores.map { score in
            winLoseResult(of: score, comparingWith: counterpartScore)
        }
        
        let totalWinCount = winLoseResults.reduce(0, { partialResult, result in
            partialResult + result.winCount
        })
        
        let totalLoseCount = winLoseResults.reduce(0, { partialResult, result in
            partialResult + result.loseCount
        })
        
        let counterpartResult = WinLoseResult(player: counterpartScore.player, winCount: totalLoseCount, loseCount: totalWinCount)!
        
        return WinLoseResults(value: [counterpartResult] + winLoseResults)
    }
    
    func winLoseResult(of score: BlackjackScore, comparingWith counterpartScore: BlackjackScore) -> WinLoseResult {
        let player = score.player
        
        if score >= counterpartScore {
            return WinLoseResult(player: player, winCount: 1, loseCount: 0)!
        }
        return WinLoseResult(player: player, winCount: 0, loseCount: 1)!
    }
}
