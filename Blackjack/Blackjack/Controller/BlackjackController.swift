//
//  BlackjackController.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/27.
//

import Foundation

struct BlackjackController {
    private let inputView = BlackjackInputView()
    private let outputView = BlackjackOutputView()
    
    func playGame() throws {
        guard let participantNames = inputView.readParticipantNames() else { throw BlackjackError.invalidInput }
        var blackjack = Blackjack(participantNames: participantNames, cardPool: CardPool())
        try blackjack.start()
        try playBetRound(of: blackjack)
        outputView.printStartStat(of: blackjack)
        
        try playCardRound(of: &blackjack)
        showResult(of: blackjack)
    }
    
    private func playBetRound(of game: Blackjack) throws {
        for participant in game.participants {
            try bet(participant: participant)
        }
    }
    
    private func bet(participant: Participant) throws {
        guard let amount = inputView.readBettingAmount(participantName: participant.name) else { throw BlackjackError.invalidInput }
        participant.bet(amount: amount)
    }
    
    private func playCardRound(of game: inout Blackjack) throws {
        for participant in game.participants {
            try playExternalCardRounds(at: &game, participant: participant)
        }
        
        try game.playDealerRound()
        outputView.printDealerRound(dealer: game.dealer)
    }
    
    private func playExternalCardRounds(at game: inout Blackjack, participant: Participant) throws {
        while let answer = inputView.readIsOneMoreRound(participantName: participant.name), answer == "y" {
            try game.playOneMoreRound(participant: participant)
            outputView.printCards(of: participant)
        }
        
        if participant.cards.count == 2 {
            outputView.printCards(of: participant)
        }
    }
    
    private func showResult(of game: Blackjack) {
        outputView.printEndStat(of: game)
        outputView.printResults(dealer: game.dealer, participants: game.participants)
    }
}
