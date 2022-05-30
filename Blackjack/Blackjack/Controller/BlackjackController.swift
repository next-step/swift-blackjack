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
        outputView.printStartStat(of: blackjack)
        
        for participant in blackjack.participants {
            try playExternalRounds(at: &blackjack, participant: participant)
        }
        
        outputView.printDealerRound(dealer: blackjack.dealer)
        try blackjack.playDealerRound()
        
        outputView.printResults(of: blackjack)
    }
    
    private func playExternalRounds(at game: inout Blackjack, participant: Participant) throws {
        while let answer = inputView.readIsOneMoreRound(participantName: participant.name), answer == "y" {
            try game.playOneMoreRound(participant: participant)
            outputView.printCards(of: participant)
        }
        
        if participant.cards.count == 2 {
            outputView.printCards(of: participant)
        }
    }
    
}
