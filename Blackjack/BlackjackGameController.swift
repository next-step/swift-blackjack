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
    
    func noticeHandOfPlayers(gameHandler: (Player) -> ()) {
        game.forEachPlayers(behavior: gameHandler)
    }
    
    func noticeTurnOfGame(gameHandler: (Player) -> ()) {
        while game.isPlayingGame() {
            turn(behavior: gameHandler)
        }
    }
    
    private func turn(behavior: (Player) -> ()) {
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
    
    func noticeResultOfGame(gameHandler: (Player) -> ()) {
        game.forEachPlayers(behavior: gameHandler)
    }
    
    func noticeWinnerOfGame(gameHandler: (Player) -> ()) {
        game.winOrLoseForPlayer(behavior: gameHandler)
    }
}
