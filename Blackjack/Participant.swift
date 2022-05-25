//
//  Participant.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

class Participant: Playable {
    private let name: String
    private var hand: HandProtocol
    private var isHit: Bool
    
    init(hand: HandProtocol = Hand(), name: String, isHit: Bool = true) {
        self.hand = hand
        self.name = name
        self.isHit = isHit
    }
    
    func giveName() -> String {
        name
    }
    
    func giveHandDescription() -> String {
        hand.giveHandDescription()
    }
    
    func hitOrStay(_ isHit: Bool) {
        self.isHit = isHit
    }
    
    func giveIsHit() -> Bool {
        isHit
    }
    
    func hit(card: Card) {
        hand.hit(card: card)
    }
    
    func takeAFirstHand(_ hand: HandProtocol) {
        self.hand = hand
    }
    
    func score() -> Int {
        hand.score()
    }
}
