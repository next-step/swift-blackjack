//
//  ResultView.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct ResultView {
    
    private enum ResultText: UserInformable {
        case score(gamer: Gamer)
        case finalProfit
        case dealerProfit(profit: Double)
        case gamerProfit(name: String, profit: Double)
        
        var guideDescription: String {
            switch self {
            case let .score(gamer):
                return "\(gamer.name)카드: \(gamer.cardsDescription) - 결과: \(gamer.totalPoint)"
            case .finalProfit:
                return "## 최종 수익"
            case let .dealerProfit(profit):
                return "딜러: \(profit)"
            case let .gamerProfit(name, profit):
                return "\(name): \(profit)"
            }
        }
    }

    
    private let userGuider = UserGuider()
    private var profitCalculator: ProfitCalculator
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.profitCalculator = ProfitCalculator(dealer: dealer, gamers: gamers)
    }
    
    func printScore(of gamers: [Gamer]) {
        gamers.forEach(printScore)
    }
    
    private func printScore(of gamer: Gamer) {
        userGuider.printGuide(for: ResultText.score(gamer: gamer))
    }
    
    func printFinalProfit(with gamers: [Gamer]) {
        userGuider.printGuide(for: ResultText.finalProfit)
        
        printDealerProfit()
        printGamersProfit(gamers)
    }
    
    private func printDealerProfit() {
        let profit: Double = profitCalculator.calculateDealerProfit()
        userGuider.printGuide(for: ResultText.dealerProfit(profit: profit))
    }
    
    private func printGamersProfit(_ gamers: [Gamer]) {
        gamers.forEach(printGamerProfit)
    }
    
    private func printGamerProfit(_ gamer: Gamer) {
        let profit: Double = profitCalculator.calculateProfit(of: gamer)
        userGuider.printGuide(for: ResultText.gamerProfit(name: gamer.name,
                                                          profit: profit))
    }
}
