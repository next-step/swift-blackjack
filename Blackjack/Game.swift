//
//  Game.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

final class Game {
    
    enum Constants {
        static let blackjack: Int = 21
        static let cardCountToDistributeAtFirst: Int = 2
    }
    
    private let inputView = InputView()

    let dealer = Dealer()
    private (set) var gamers: [Gamer] = []
    var allPlayers: [Gamer] {
        return [dealer] + gamers
    }
    
    func receiveGamers() {
        let gamers: [Gamer] = inputView.receiveGamers()
        self.gamers = gamers
    }
    
    func receiveBettingMoneyForGamers() throws {
        try gamers.forEach { gamer in
            let bettingMoney: Double = try inputView.receiveBettingMoney(of: gamer)
            gamer.bettingMoney = bettingMoney
        }
    }
    
    func distributeCardsToEveryoneAtFirst() throws {
        try distributeCardsAtFirst(to: dealer)
        try gamers.forEach(distributeCardsAtFirst)
    }
    
    private func distributeCardsAtFirst(to gamer: Gamer) throws {
        try (0..<Constants.cardCountToDistributeAtFirst).forEach { _ in
            try distributeCard(to: gamer)
        }
    }
    
    func distributeCardToDealder() throws {
        try distributeCard(to: dealer)
    }
    
    private func distributeCard(to gamer: Gamer) throws {
        let card = try dealer.drawCard()
        gamer.appendCard(card)
    }
    
    func decideToHitOrStay(of gamer: Gamer) throws {
        let gamerState = try inputView.receiveToHitOrStay(of: gamer)
        gamer.state = gamerState
    }
    
    func distributeCardIfStateIsHit(to gamer: Gamer) throws {
        if gamer.state == .hit {
            try distributeCard(to: gamer)
        }
    }
}
