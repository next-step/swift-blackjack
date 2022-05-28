//
//  ProfitCalculator.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/28.
//

import Foundation

struct ProfitCalculator {
    
    private enum Constants {
        static let blackjackAtFirstMultiplier: Double = 1.5
    }
    
    private let dealer: Dealer
    private let gamers: [Gamer]
    private let gamerOutcomeCalculator: GamerResult
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
        self.gamerOutcomeCalculator = GamerResult(dealer: dealer, gamers: gamers)
    }
    
    func calculateProfit(of gamer: Gamer) -> Double {
        return 0
    }
    
    func calculateDealerProfit() -> Double {
        return 0
    }
}
