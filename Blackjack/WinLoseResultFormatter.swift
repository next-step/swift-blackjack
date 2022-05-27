//
//  WinLoseResultFormatter.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

struct WinLoseFormatter {
    static func format(winLoseResults: WinLoseResults) -> String {
        return winLoseResults.value.map { result in
            if result.winCount == 0 &&  result.loseCount == 1 {
                return "\(result.player.name.value): 패"
            }
            if result.winCount == 1 &&  result.loseCount == 0 {
                return "\(result.player.name.value): 승"
            }
            return "\(result.player.name.value): \(result.winCount)승 \(result.loseCount)패"
        }.reduce("") { partialResult, result in
            partialResult + result + "\n"
        }
    }
}
