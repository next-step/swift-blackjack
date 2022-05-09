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
    func winOrLoseForPlayer(behavior: (Playable) -> ())
    func turnTodealer() -> Playable?
}

class Players: PlayersProtocol {
    private var players: [Playable] = []
    private let cardDeck: CardDeckProtocol
    private lazy var turnToHit: Playable? = players.first
    private lazy var dealer: Playable? = players.last
    
    init?(with names: [String], with dealer: Playable = Dealer(), cardDeck: CardDeckProtocol) {
        self.cardDeck = cardDeck
        guard names.count > 0 || cardDeck.count() > 0 else { return nil }
        names.forEach { name in
            let participant = Participant(name: name)
            players.append(participant)
        }
        players.append(dealer)
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
    
    func turnTodealer() -> Playable? {
        dealer
    }
    
    func winOrLoseForPlayer(behavior: (Playable) -> ()) {
        players.forEach { player in
            guard player.giveName() != dealer?.giveName() else { return behavior(player) }
            guard player.score() >= dealer?.score() ?? 0 else {
                player.record(.lose)
                dealer?.record(.win)
                return behavior(player)
            }
            player.record(.win)
            dealer?.record(.lose)
            behavior(player)
        }
    }
    
    //FIXME: - 리팩터링 필요
    func turnForPlayer(behavior: (Playable) -> ()) {
        players.forEach { player in
            var currentTurnToPlayer: Playable? = nil

            if turnToHit?.giveIsHit() == true && turnToHit?.giveName() == player.giveName() {
                turnToHit?.hit(card: cardDeck.handOutCard())
                return behavior(player)
            }

            guard turnToHit?.giveIsHit() == true else {
                turnToHit = player
                return
            }

            guard let turnPlayer = currentTurnToPlayer else { return }
            currentTurnToPlayer = player
            behavior(turnPlayer)
        }
    }
}
