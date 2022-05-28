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
    private let gamerOutcomeCalculator: GamerOutcomeCalculator
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
        self.gamerOutcomeCalculator = GamerOutcomeCalculator(dealer: dealer, gamers: gamers)
    }
    
    func calculateProfit(of gamer: Gamer) -> Double {
        let isGamerBlackjackAtFirst: Bool = {
            let isGamerBlackjack: Bool = gamer.cards.totalPoint == Game.Constants.blackjack
            let isGamerStayAtFirst: Bool = gamer.cards.count == Game.Constants.cardCountToDistributeAtFirst
            return isGamerBlackjack && isGamerStayAtFirst
        }()
        
        let gamerOutcome: GamerOutcomeCalculator.Outcome = gamerOutcomeCalculator.outcome(of: gamer)
        switch gamerOutcome {
        case .win where isGamerBlackjackAtFirst:
            return gamer.bettingMoney * Constants.blackjackAtFirstMultiplier
        case .win:
            return gamer.bettingMoney
        case .draw:
            return 0
        case .lose:
            return -gamer.bettingMoney
        }
    }
    
    func calculateDealerProfit() -> Double {
        let totalGamerProfit: Double = gamers.map(calculateProfit)
            .reduce(0, +)
        let dealerProfit: Double = -totalGamerProfit
        return dealerProfit
    }
}
