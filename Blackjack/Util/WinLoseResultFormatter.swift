//
//  WinLoseResultFormatter.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

struct WinLoseResultFormatter {
    static func format(winLoseResults: WinLoseResults) -> String {
        let standardResult = winLoseResults.standardResult
        let standardResultText = "\(standardResult.player.name.value): \(standardResult.winCount)승 \(standardResult.loseCount)패"

        return winLoseResults.playerResults.reduce(standardResultText) { partialResult, result in
            if result.winCount == 0 {
                return partialResult + "\n" + "\(result.player.name.value): 패"
            }
            return partialResult + "\n" + "\(result.player.name.value): 승"
        }
    }
}
