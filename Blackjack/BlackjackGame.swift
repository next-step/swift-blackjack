//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/05.
//

import Foundation

protocol BlackjackGameable {
    func forEachPlayers(behavior: (Playable) -> ())
    func turnForPlayer(behavior: (Playable) -> ())
    func isPlayingGame() -> Bool
    func turnToPlayer() -> Playable?
}

struct BlackjackGame: BlackjackGameable {
    private let players: PlayersProtocol
    
    init(players: PlayersProtocol) {
        self.players = players
        handOutFirstHand()
    }
    
    func handOutFirstHand() {
        players.handOutFirstHand()
    }
    
    func forEachPlayers(behavior: (Playable) -> ()) {
        players.forEachPlayers { participant in
            behavior(participant)
        }
    }
    
    func turnForPlayer(behavior: (Playable) -> ()) {
        players.turnForPlayer(behavior: behavior)
    }
    
    func turnToPlayer() -> Playable? {
        players.turnToPlayer()
    }
    
    func isPlayingGame() -> Bool {
        var isPlayingGame: Bool = false
        
        players.forEachPlayers { participant in
            isPlayingGame = participant.giveIsHit()
        }
        
        return isPlayingGame
    }
}
