//
//  Game.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

class Game {
    
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
    
    func distributeTwoCardsToEveryone() throws {
        try distributeTwoCards(to: dealer)
        try gamers.forEach(distributeTwoCards)
    }
    
    private func distributeTwoCards(to gamer: Gamer) throws {
        try distributeCard(to: gamer)
        try distributeCard(to: gamer)
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
