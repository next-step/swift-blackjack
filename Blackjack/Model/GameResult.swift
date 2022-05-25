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
    
    var dealerDescription: String {
        return dealerResult.description
    }
    
    func gamerDescription(_ gamer: Gamer) -> String {
        return gamerResult.description(of: gamer)
    }
}
