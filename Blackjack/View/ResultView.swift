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
        case finalOutcome
        case dealerOutcome(description: String)
        case gamerOutcome(name: String, description: String)
        
        var guideDescription: String {
            switch self {
            case let .score(gamer):
                return "\(gamer.name)카드: \(gamer.cardsDescription) - 결과: \(gamer.totalPoint)"
            case .finalOutcome:
                return "## 최종 승패"
            case let .dealerOutcome(description):
                return "딜러 \(description)"
            case let .gamerOutcome(name, description):
                return "\(name): \(description)"
            }
        }
    }

    
    private let userGuider = UserGuider()
    private var gameResult: GameResult
    
    init(gameResult: GameResult) {
        self.gameResult = gameResult
    }
    
    func printScore(of gamers: [Gamer]) {
        gamers.forEach(printScore)
    }
    
    private func printScore(of gamer: Gamer) {
        userGuider.printGuide(for: ResultText.score(gamer: gamer))
    }
    
    func printFinalOutcome(with gamers: [Gamer]) {
        userGuider.printGuide(for: ResultText.finalOutcome)
        
        printDealerOutcome()
        printGamersOutcome(gamers)
    }
    
    private func printDealerOutcome() {
        let description: String = gameResult.dealerDescription
        userGuider.printGuide(for: ResultText.dealerOutcome(description: description))
    }
    
    private func printGamersOutcome(_ gamers: [Gamer]) {
        gamers.forEach(printGamerOutcome)
    }
    
    private func printGamerOutcome(_ gamer: Gamer) {
        let description: String = gameResult.gamerDescription(gamer)
        userGuider.printGuide(for: ResultText.gamerOutcome(name: gamer.name,
                                                           description: description))
    }
}
