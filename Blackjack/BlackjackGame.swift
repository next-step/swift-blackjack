//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/05.
//

import Foundation

protocol BlackjackGameable {
    func forEachPlayers(behavior: (Player) -> ())
    func turnForPlayer(behavior: (Player) -> ())
    func isPlayingGame() -> Bool
    func turnToPlayer() -> Player?
    func winOrLoseForPlayer(behavior: (Player) -> ())
    func dealer() -> Player?
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
    
    func forEachPlayers(behavior: (Player) -> ()) {
        players.forEachPlayers(behavior: behavior)
    }
    
    func turnForPlayer(behavior: (Player) -> ()) {
        players.turnForPlayer(behavior: behavior)
    }
    
    func turnToPlayer() -> Player? {
        players.turnToPlayer()
    }
    
    func dealer() -> Player? {
        players.turnTodealer()
    }
    
    func isPlayingGame() -> Bool {
        var isPlayingGame: Bool = false
        
        players.forEachPlayers { participant in
            isPlayingGame = participant.giveIsHit()
        }
        
        return isPlayingGame
    }
    
    func winOrLoseForPlayer(behavior: (Player) -> ()) {
        players.winOrLoseForPlayer(behavior: behavior)
    }
}
