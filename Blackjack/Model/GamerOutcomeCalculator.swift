//
//  GamerOutcomeCalculator.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/25.
//

import Foundation

struct GamerOutcomeCalculator {
    
    enum Outcome: UserInformable {
        case win
        case draw
        case lose
        
        var guideDescription: String {
            switch self {
            case .win:
                return "승"
            case .draw:
                return "무"
            case .lose:
                return "패"
            }
        }
    }
    
    private let dealer: Dealer
    private let gamers: [Gamer]
    private let thresholdChecker = ThresholdChecker()
    private var winningPoint: Int {
        let allPlayers: [Gamer] = gamers + [dealer]
        let winningPoint: Int = allPlayers
            .filter { gamer in
                thresholdChecker.isTotalPointUnderThreshold(of: gamer.cards.cards)
            }
            .map { $0.cards.totalPoint }.max() ?? 0
        return winningPoint
    }
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
    }
    
    func outcome(of gamer: Gamer) -> Outcome {
        guard !dealer.cards.isBurst else {
            return .win
        }
        
        guard !gamer.cards.isBurst else {
            return .lose
        }

        let isGamerHasWinningPoint: Bool =  gamer.cards.totalPoint == winningPoint
        guard isGamerHasWinningPoint else {
            return .lose
        }
        
        let isDealerHasWinningPoint: Bool = dealer.cards.totalPoint == winningPoint
        if isDealerHasWinningPoint {
            return .draw
        } else {
            return .win
        }
    }
}
