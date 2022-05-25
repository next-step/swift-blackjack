//
//  GamePlayView.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/26.
//

import Foundation

struct GamePlayView {
    private enum GamePlayText: UserInformable {
        case distributeCards(gamers: [Gamer])
        case cards(gamer: Gamer)
        case a
        
        var guideDescription: String {
            switch self {
            case let .distributeCards(gamers):
                return "\(gamers.map { $0.name }.joined(separator: ", ") )에게 2장씩 나누었습니다."
            case let .cards(gamer):
                return "\(gamer.name)카드: \(gamer.cardsDescription)"
            case .a:
                return "딜러는 \(Dealer.Constants.getMoreCardThreshold)이하라 한장의 카드를 더 받았습니다."
            }
            
        }
    }
    
    private let userGuider = UserGuider()
    
    func printDistributeCards(to gamers: [Gamer]) {
        userGuider.printGuide(for: GamePlayText.distributeCards(gamers: gamers))
    }
    
    func printCards(of gamers: [Gamer]) {
        gamers.forEach(printCards)
    }
    
    func printCards(of gamer: Gamer) {
        userGuider.printGuide(for: GamePlayText.cards(gamer: gamer))
    }
    
    func printDealer() {
        userGuider.printGuide(for: GamePlayText.a)
    }
}
