//
//  Players.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/05.
//

import Foundation

protocol PlayersProtocol {
    func handOutFirstHand()
    func forEachPlayers(behavior: (Playable) -> ())
    func turnForPlayer(behavior: (Playable) -> ())
    func turnToPlayer() -> Playable?
}

class Players: PlayersProtocol {
    private var players: [Playable] = []
    private let cardDeck: CardDeckProtocol
    private lazy var turnToHit: Playable? = players.first
    
    init?(with names: [String], cardDeck: CardDeckProtocol) {
        self.cardDeck = cardDeck
        guard names.count > 0 || cardDeck.count() > 0 else { return nil }
        names.forEach { name in
            let participant = Participant(name: name)
            players.append(participant)
        }
    }
    
    func handOutFirstHand() {
        players.forEach { player in
            guard let hand = cardDeck.makeHand() else { return }
            player.takeAFirstHand(hand)
        }
    }
    
    func forEachPlayers(behavior: (Playable) -> ()) {
        players.forEach(behavior)
    }
    
    func turnToPlayer() -> Playable? {
        turnToHit
    }
    
    //FIXME: - 리팩터링 필요
    func turnForPlayer(behavior: (Playable) -> ()) {
        players.forEach { player in
            var currentTurnToPlayer: Playable? = nil

            hitPlayer(player: player, behavior: behavior)

            guard turnToHit?.giveIsHit() == true else {
                turnToHit = player
                return
            }

            guard let turnPlayer = currentTurnToPlayer else { return }
            currentTurnToPlayer = player
            behavior(turnPlayer)
        }
    }
    
    private func hitPlayer(player: Playable, behavior: (Playable) -> ()) {
        if turnToHit?.giveIsHit() == true && turnToHit?.giveName() == player.giveName() {
            turnToHit?.hit(card: cardDeck.handOutCard())
            return behavior(player)
        }
    }
}
