//
//  Dealer.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/08.
//

import Foundation

class Dealer: Playable {
    private let name: String
    private var hand: HandProtocol
    private var state: Statable
    
    init(hand: HandProtocol = Hand(), state: Statable = State()) {
        self.hand = hand
        self.name = "딜러"
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
        var isWinCount: Int = 0
        var isLoseCount: Int = 0
        
        state.giveWinLoseRecord().forEach { winLose in
            winLose == .win ? (isWinCount += 1) : (isLoseCount += 1)
        }
        
        let winLoseMessage = "\(isWinCount)승 \(isLoseCount)패"
        return winLoseMessage
    }
}
