//
//  GameResult.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/26.
//

import Foundation

struct GameResult {
    
    private let gamerResult: GamerResult
    private let dealerResult: DealerResult
   
    init(dealer: Dealer, gamers: [Gamer]) {
        self.gamerResult = GamerResult(dealer: dealer, gamers: gamers)
        self.dealerResult = DealerResult(dealer: dealer, gamers: gamers)
    }
    
    var dealerOutCome: DealerResult.Outcome  {
        return dealerResult.outcome
    }
    
    func gamerOutcome(_ gamer: Gamer) -> GamerResult.Outcome {
        return gamerResult.outcome(of: gamer)
    }
}
