//
//  BlackjackGameJudge.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

protocol GameJudge {
    func winLoseResults(of scores: [BlackjackScore], comparingWith counterpartScore: BlackjackScore) -> WinLoseResults
    func winLoseResult(of score: BlackjackScore, comparingWith counterpartScore: BlackjackScore) -> WinLoseResult
}

struct BlackjackGameJudge: GameJudge {
    func winLoseResults(of scores: [BlackjackScore], comparingWith standardScore: BlackjackScore) -> WinLoseResults {
        let winLoseResults = scores.map { score in
            winLoseResult(of: score, comparingWith: standardScore)
        }
        
        let winLoseResultOfStandard = winLoseResultOf(standardScore: standardScore, comparingWith: winLoseResults)
        
        return WinLoseResults(standardResult: winLoseResultOfStandard, playerResults: winLoseResults)
    }
    
    private func winLoseResultOf(standardScore: BlackjackScore, comparingWith winLoseResults: [WinLoseResult]) -> WinLoseResult {
        let loseCountOfStandard = winLoseResults.reduce(0, { partialResult, result in
            partialResult + result.winCount
        })
        
        let winCountOfStandard = winLoseResults.reduce(0, { partialResult, result in
            partialResult + result.loseCount
        })
        
        let winLoseResultOfStandard = WinLoseResult(player: standardScore.player,
                                                    winCount: winCountOfStandard,
                                                    loseCount: loseCountOfStandard)!
        
        return winLoseResultOfStandard
    }
    
    func winLoseResult(of score: BlackjackScore, comparingWith standardScore: BlackjackScore) -> WinLoseResult {
        let player = score.player
        
        if standardScore.isBigger(than: BlackjackScoreRule.twentyOne) {
            return WinLoseResult(player: player, winCount: 1, loseCount: 0)!
        }
        
        if score.isBigger(than: BlackjackScoreRule.twentyOne) {
            return WinLoseResult(player: player, winCount: 0, loseCount: 1)!
        }
        if score >= standardScore {
            return WinLoseResult(player: player, winCount: 1, loseCount: 0)!
        }
        return WinLoseResult(player: player, winCount: 0, loseCount: 1)!
    }
}
