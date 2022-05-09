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
    private var state: Statable
    
    init(hand: HandProtocol = Hand(), name: String, state: Statable = State()) {
        self.hand = hand
        self.name = name
        self.state = state
    }
    
    func giveName() -> String {
        name
    }
    
    func giveHandDescription() -> String {
        hand.giveHandDescription()
    }
    
    func hitOrStay(_ isHit: Bool) {
        state.hitOrStay(isHit)
    }
    
    func giveIsHit() -> Bool {
        state.giveIsHit()
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
    
    func record(_ winLose: WinLose) {
        state.record(winLose)
    }
    
    func giveWinLoseRecord() -> String {
        guard let winLose = state.giveWinLoseRecord().last else { return "" }
        return winLose == .win ? "승" : "패"
    }
}
