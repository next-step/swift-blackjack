//
//  Dealer.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/08.
//

import Foundation

class Dealer: Player {
    private var profitAmount: Int
    
    init(hand: HandProtocol = Hand(), state: Statable = State(bettingAmount: 0)) {
        self.profitAmount = 0
        super.init(name: "딜러")
    }

    override func takeAFirstHand(_ hand: HandProtocol) {
        super.hand = hand
    }
    
    override func record(_ winLose: PlayersGameResult, amount: Int? = nil) {
        super.state.record(winLose)
        guard let amount = amount else { return }
        if winLose == .win {
            profitAmount += amount
        } else {
            profitAmount -= amount
        }
    }
    
    override func giveWinLoseRecord() -> String {
        var isWinCount: Int = 0
        var isLoseCount: Int = 0
        
        super.state.giveWinLoseRecord().forEach { winLose in
            winLose == .win ? (isWinCount += 1) : (isLoseCount += 1)
        }
        
        let winLoseMessage = "\(isWinCount)승 \(isLoseCount)패"
        return winLoseMessage
    }
    
    override func profit() -> Int {
        profitAmount
    }
    
    override func betting() -> Int? {
        nil
    }
}
