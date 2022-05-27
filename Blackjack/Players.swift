//
//  Players.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/05.
//

import Foundation

protocol PlayersProtocol {
    func handOutFirstHand()
    func forEachPlayers(behavior: (Player) -> ())
    func turnForPlayer(behavior: (Player) -> ())
    func turnToPlayer() -> Player?
    func winOrLoseForPlayer(behavior: (Player) -> ())
    func turnTodealer() -> Player?
}

typealias ProfileOfParticipant = (name: String, bettingAmount: Int)

class Players: PlayersProtocol {
    private var players: [Player] = []
    private let cardDeck: CardDeckProtocol
    private lazy var turnToHit: Player? = players.first
    private lazy var dealer: Player? = players.last
    
    init?(with profiles: [ProfileOfParticipant], with dealer: Player = Dealer(), cardDeck: CardDeckProtocol) {
        self.cardDeck = cardDeck
        guard profiles.count > 0 || cardDeck.count() > 0 else { return nil }
        
        profiles.forEach { name, bettingAmount in
            let participant = Participant(name: name, bettingAmount: bettingAmount)
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
    
    func forEachPlayers(behavior: (Player) -> ()) {
        players.forEach(behavior)
    }
    
    func turnToPlayer() -> Player? {
        turnToHit
    }
    
    func turnTodealer() -> Player? {
        dealer
    }
    
    func winOrLoseForPlayer(behavior: (Player) -> ()) {
        players.forEach { player in
            guard player.giveName() != dealer?.giveName() else { return behavior(player) }
            
            guard (dealer?.score() ?? 0) <= WinningScore.number else {
                judgeWinLose(participantWinLose: .win, dealerWinLose: .lose, player: player, behavior: behavior)
                return
            }
            
            guard player.score() <= WinningScore.number else {
                judgeWinLose(participantWinLose: .lose, dealerWinLose: .win, player: player, behavior: behavior)
                return
            }
            
            guard player.score() >= dealer?.score() ?? 0 else {
                judgeWinLose(participantWinLose: .lose, dealerWinLose: .win, player: player, behavior: behavior)
                return
            }
            
            judgeWinLose(participantWinLose: .win, dealerWinLose: .lose, player: player, behavior: behavior)
        }
    }
    
    func turnForPlayer(behavior: (Player) -> ()) {
        players.forEach { player in
            var currentTurnToPlayer: Player? = nil
            
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
    
    private func hitPlayer(player: Player, behavior: (Player) -> ()) {
        if turnToHit?.giveIsHit() == true && turnToHit?.giveName() == player.giveName() {
            turnToHit?.hit(card: cardDeck.handOutCard())
            return behavior(player)
        }
    }
    
    private func judgeWinLose(participantWinLose: WinLose, dealerWinLose: WinLose, player: Player, behavior: (Player) -> ()) {
        player.record(participantWinLose, amount: player.betting())
        dealer?.record(dealerWinLose, amount: player.betting())
        return behavior(player)
    }
}
