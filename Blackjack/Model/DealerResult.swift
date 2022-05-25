//
//  DealerResult.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/26.
//

import Foundation

struct DealerResult {
    
    struct Outcome {
        let winningCount: Int
        let drawCount: Int
        let loseCount: Int
    }
    
    private let dealer: Dealer
    private let gamers: [Gamer]
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
    }
    
    var outcome: Outcome {
        
        guard !dealer.isBurst else {
            return Outcome(winningCount: 0,
                           drawCount: 0,
                           loseCount: gamers.count)
        }
        
        return Outcome(winningCount: winningCount,
                       drawCount: drawCount,
                       loseCount: loseCount)
    }
    
    private var winningCount: Int  {
        gamers.filter { gamer in
            let isGamerBurst: Bool = gamer.isBurst
            let isHigherPointDealer: Bool = gamer.totalPoint < dealer.totalPoint
            return isGamerBurst || isHigherPointDealer
        }.count
    }
    
    private var drawCount: Int  {
        gamers.filter { gamer in
            let isSamePointDealer: Bool = gamer.totalPoint == dealer.totalPoint
            return isSamePointDealer
        }.count
    }
    
    private var loseCount: Int  {
        gamers.filter { gamer in
            let isGamerBurst: Bool = gamer.isBurst
            let isLowerPointDealer: Bool = gamer.totalPoint > dealer.totalPoint
            return isLowerPointDealer && !isGamerBurst
        }.count
    }
}
