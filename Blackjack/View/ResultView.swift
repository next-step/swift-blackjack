//
//  ResultView.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct ResultView {

    private enum ResultText: UserInformable {
        case distributeCards(gamers: [Gamer])
        case cards(gamer: Gamer)
        case score(gamer: Gamer)
        
        var guideDescription: String {
            switch self {
            case let .distributeCards(gamers):
                return "\(gamers.map { $0.name }.joined(separator: ",") )에게 2장씩 나누었습니다."
            case let .cards(gamer):
                return "\(gamer.name)카드: \(cardDescriptions(of: gamer.cards))"
            case let .score(gamer):
                return "\(gamer.name)카드: \(cardDescriptions(of: gamer.cards)) - 결과: \(gamer.totalPoint)"
            }
        }
        
        private func cardDescriptions(of cards: [Card]) -> String {
            cards.map { card in
                let denomination: String = card.denomination.guideDescription
                let suit: String = card.suit.guideDescription
                return denomination + suit
            }.joined(separator: ", ")
        }
    }
    
    private let userGuider = UserGuider()
    
    func printDistributeCards(to gamers: [Gamer]) {
        userGuider.printGuide(for: ResultText.distributeCards(gamers: gamers))
    }
   
    func printCards(of gamers: [Gamer]) {
        gamers.forEach(printCards)
    }
    
    func printCards(of gamer: Gamer) {
        userGuider.printGuide(for: ResultText.cards(gamer: gamer))
    }
    
    func printScore(of gamers: [Gamer]) {
        gamers.forEach(printScore)
    }
    
    private func printScore(of gamer: Gamer) {
        userGuider.printGuide(for: ResultText.score(gamer: gamer))
    }
}
