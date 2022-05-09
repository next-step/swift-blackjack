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
    func winOrLoseForPlayer(behavior: (Playable) -> ())
    func dealer() -> Playable?
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
        players.forEachPlayers(behavior: behavior)
    }
    
    func turnForPlayer(behavior: (Playable) -> ()) {
        players.turnForPlayer(behavior: behavior)
    }
    
    func turnToPlayer() -> Playable? {
        players.turnToPlayer()
    }
    
    func dealer() -> Playable? {
        players.turnTodealer()
    }
    
    func isPlayingGame() -> Bool {
        var isPlayingGame: Bool = false
        
        players.forEachPlayers { participant in
            isPlayingGame = participant.giveIsHit()
        }
        
        return isPlayingGame
    }
    
    func winOrLoseForPlayer(behavior: (Playable) -> ()) {
        players.winOrLoseForPlayer(behavior: behavior)
    }
}
