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
    private var winningPoint: Int {
        let allPlayers: [Gamer] = gamers + [dealer]
        let winningPoint: Int = allPlayers
            .filter { gamer in
                ThresholdChecker().isTotalPointUnderThreshold(of: gamer.cards)
            }
            .map { $0.totalPoint }.max() ?? 0
        return winningPoint
    }
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
    }
    
    func outcome(of gamer: Gamer) -> Outcome {
        guard !dealer.isBurst else {
            return .win
        }
        
        guard !gamer.isBurst else {
            return .lose
        }

        let isGamerHasWinningPoint: Bool =  gamer.totalPoint == winningPoint
        guard isGamerHasWinningPoint else {
            return .lose
        }
        
        let isDealerHasWinningPoint: Bool = dealer.totalPoint == winningPoint
        if isDealerHasWinningPoint {
            return .draw
        } else {
            return .win
        }
    }
}
