//
//  Participant.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

class Participant: Player {
    
    func isWin(compareWith dealer: Dealer) -> WinningState {
        guard score <= 21 else { return .defeat }
        guard dealer.score <= 21 else { return .win }
        
        if dealer.score > score {
            return .defeat
        }
        return .win
    }
}
