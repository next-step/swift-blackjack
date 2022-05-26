//
//  BlackjackController.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/27.
//

import Foundation

struct BlackjackController {
    let inputView = BlackjackInputView()
    let outputView = BlackjackOutputView()
    
    func startGame() throws {
        guard let participantNames = inputView.readParticipantNames() else { throw BlackjackError.invalidInput }
        var blackjack = Blackjack(participantNames: participantNames)
        try blackjack.start()
        outputView.printStartStat(of: blackjack)
        
        
    }
    
}
