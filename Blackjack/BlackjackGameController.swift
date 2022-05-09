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
    
    func noticeTurnOfGame(gameHandler: (Playable) -> ()) {
        while game.isPlayingGame() {
            turn(behavior: gameHandler)
        }
    }
    
    private func turn(behavior: (Playable) -> ()) {
        if isDealer() {
            turnForDealer()
        } else {
            turnForParticipant()
        }
        
        game.turnForPlayer { turnToPlayer in
            behavior(turnToPlayer)
        }
    }
    
    private func turnForParticipant() {
        guard let turnToPlayer = game.turnToPlayer() else { return }
        
        let hitOrStay = InputView.readAskHitToParticipants(to: turnToPlayer)
        turnToPlayer.hitOrStay(hitOrStay)
    }
    
    private func turnForDealer() {
        guard let turnToPlayer = game.turnToPlayer() else { return }
        
        if turnToPlayer.score() <= 17 {
            turnToPlayer.hitOrStay(true)
            ResultView.printHitDlear()
        } else {
            turnToPlayer.hitOrStay(false)
        }
    }
    
    private func isDealer() -> Bool {
        guard let turnToPlayer = game.turnToPlayer() else { return false }
        guard let delar = game.dealer() else { return false }
        
        return turnToPlayer.giveName() == delar.giveName()
    }
    
    func noticeResultOfGame(gameHandler: (Playable) -> ()) {
        game.forEachPlayers(behavior: gameHandler)
    }
    
    func noticeWinnerOfGame(gameHandler: (Playable) -> ()) {
        game.winOrLoseForPlayer(behavior: gameHandler)
    }
}
