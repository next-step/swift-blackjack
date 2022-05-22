//
//  Game.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

class Game {
    
    private let inputView = InputView()

    private var dealer = Dealer()
    private (set) var gamers: [Gamer] = []
    
    func receiveGamers() {
        let gamers: [Gamer] = inputView.receiveGamers()
        self.gamers = gamers
    }
    
    func distributeTwoCardsToEachGamer() throws {
        try gamers.forEach { gamer in
            try distributeCard(to: gamer)
            try distributeCard(to: gamer)
        }
    }
    
    private func distributeCard(to gamer: Gamer) throws {
        let card = try dealer.drawCard()
        try gamer.appendCard(card)
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
