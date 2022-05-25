//
//  DealerOutcome+Extension.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/25.
//

import Foundation

extension GameResult.DealerOutcome: Equatable {
    static func == (lhs: GameResult.DealerOutcome, rhs: GameResult.DealerOutcome) -> Bool {
        lhs.winningCount == rhs.winningCount
        && lhs.drawCount == rhs.drawCount
        && lhs.loseCount == rhs.loseCount
    }
}
