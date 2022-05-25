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
        
        var guideDescription: String {
            switch self {
            case let .score(gamer):
                return "\(gamer.name)카드: \(gamer.cardsDescription) - 결과: \(gamer.totalPoint)"
            }
        }
    }
    
    private let userGuider = UserGuider()
    
    }
    
    func printScore(of gamers: [Gamer]) {
        gamers.forEach(printScore)
    }
    
    private func printScore(of gamer: Gamer) {
        userGuider.printGuide(for: ResultText.score(gamer: gamer))
    }
}
