//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

import Foundation

struct BlackjackGame {
    var deck: Deck
    let players: Players
    
    init(deck: Deck = Deck(), players: Players) {
        self.deck = deck
        self.players = players
    }
    
    private func handout(count: Int) throws {
        try (0..<count).forEach { _ in
            try players.handoutAllPlayers(deck: deck)
        }
        ResultView.printDistributeMessage(from: players)
        ResultView.printAllPlayerCards(from: players)
    }
    
    func ask() throws {
        try players.askContinue { (result, player) in
            if result {
                try player.deal(deck.drawCard())
                ResultView.printPlayerCards(of: player.name, players: players)
                return try ask()
            } else {
                player.playing = false
            }
        }
    }
    
    func startGame() throws {
        try handout(count: Constants.handoutCount)
        try ask()
        ResultView.printGameResult(of: players)
    }
}
