//
//  Blackjack.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct Blackjack {
    var participants: [Participant]
    
    init(participantNames: [String]) {
        self.participants = participantNames.compactMap({ Participant.init(name: $0) })
    }
    
    mutating func start() throws {
        for participant in participants {
            participant.add(card: try Card.generateRandomCard())
            participant.add(card: try Card.generateRandomCard())
        }
    }
    
    func playOneMoreRound(participant: Participant) throws {
        participant.add(card: try Card.generateRandomCard())
    }
}
