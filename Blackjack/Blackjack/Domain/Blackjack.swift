//
//  Blackjack.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct Blackjack {
    var dealer: Dealer = Dealer()
    
    var participants: [Participant]
    private var cardPool: CardPool
    
    init(participantNames: [String], cardPool: CardPool) {
        self.participants = participantNames.compactMap({ Participant.init(name: $0) })
        self.cardPool = cardPool
    }
    
    mutating func start() throws {
        try giveCard(to: dealer, count: 2)
        for participant in participants {
            try giveCard(to: participant, count: 2)
        }
    }
    
    mutating func playDealerRound() throws {
        guard dealer.score <= 16 else { return }
        try giveCard(to: dealer, count: 1)
    }
    
    mutating func playOneMoreRound(participant: Player) throws {
        try giveCard(to: participant, count: 1)
    }
    
    private mutating func giveCard(to participant: Player, count: Int) throws {
        for _ in 0..<count {
            participant.add(card: try cardPool.generateRandomCard())
        }
    }
}
