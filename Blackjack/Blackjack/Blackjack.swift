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
        for index in 0..<participants.count {
            participants[index].add(card: try Card.generateRandomCard())
            participants[index].add(card: try Card.generateRandomCard())
        }
    }
}
