//
//  BlackjackGameController.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/06.
//

import Foundation

struct BlackjackGameContrller {
    private let game: BlackjackGameable
    
    init(with game: BlackjackGameable) {
        self.game = game
    }
    
    func noticeHandOfPlayers(gameHandler: (Playable) -> ()) {
        game.forEachPlayers(behavior: gameHandler)
    }
    
    func noticeResultOfGame(gameHandler: (Playable) -> ()) {
        game.forEachPlayers(behavior: gameHandler)
    }
}
