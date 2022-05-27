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
    
    func start() throws {
        for participant in participants {
            try giveCard(to: participant, count: 2)
        }
    }
    
    func playOneMoreRound(participant: Participant) throws {
        try giveCard(to: participant, count: 1)
    }
    
    private func giveCard(to participant: Participant, count: Int) throws {
        for _ in 0..<count {
            participant.add(card: try Card.generateRandomCard())
        }
    }
}
