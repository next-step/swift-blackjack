//
//  GameResult.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/25.
//

import Foundation

struct GameResult {
    
    enum OutCome {
        case win
        case draw
        case lose
    }
    
    struct DealerOutcome {
        let winningCount: Int
        let drawCount: Int
        let loseCount: Int
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
    
    var dealerOutcome: DealerOutcome {
        
        guard !dealer.isBurst else {
            return DealerOutcome(winningCount: 0,
                                 drawCount: 0,
                                 loseCount: gamers.count)
        }
        
        let winningCount: Int = gamers.filter { gamer in
            let isGamerBurst: Bool = gamer.isBurst
            let isHigherPointDealer: Bool = gamer.totalPoint < dealer.totalPoint
            return isGamerBurst || isHigherPointDealer
        }.count
        
        let drawCount: Int = gamers.filter { gamer in
            let isSamePointDealer: Bool = gamer.totalPoint == dealer.totalPoint
            return isSamePointDealer
        }.count
        
        let loseCount: Int = gamers.filter { gamer in
            let isGamerBurst: Bool = gamer.isBurst
            let isLowerPointDealer: Bool = gamer.totalPoint > dealer.totalPoint
            return isLowerPointDealer && !isGamerBurst
        }.count
        
        return DealerOutcome(winningCount: winningCount,
                             drawCount: drawCount,
                             loseCount: loseCount)
    }
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
    }
    
    func outcome(of gamer: Gamer) -> OutCome {
        guard !dealer.isBurst else {
            return .win
        }
        
        guard !gamer.isBurst else {
            return .lose
        }
        
        let isGamerPointOverWinningPoint: Bool = gamer.totalPoint >= winningPoint
        if isGamerPointOverWinningPoint {
            let isGamerPointSameWithDealer: Bool = dealer.totalPoint == gamer.totalPoint
            if isGamerPointSameWithDealer {
                return .draw
            } else {
                return .win
            }
        } else {
            return .lose
        }
    }
}
