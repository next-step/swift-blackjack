//
//  BlackjackScoreFormatter.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

enum BlackjackScoreFormatter {
    static func format(scores: [BlackjackScore]) -> String{
        scores.reduce("") { partialResult, score in
            let formattedPlayer = PlayerFormatter.format(player: score.player)
            return partialResult + formattedPlayer + "- 결과: \(score.score)\n"
        }
    }
}
