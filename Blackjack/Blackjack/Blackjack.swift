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
        self.participants = participantNames.compactMap(Participant.init)
    }
}
