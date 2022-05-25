//
//  GameResult.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/25.
//

import Foundation

struct GameResult {
    
    enum OutCome {
        case win
        case draw
        case lose
    }
    
    struct DealerOutcome {
        let winningCount: Int
        let drawCount: Int
        let loseCount: Int
    }
    
    private let dealer: Dealer
    private let gamers: [Gamer]
    
    init(dealer: Dealer, gamers: [Gamer]) {
        self.dealer = dealer
        self.gamers = gamers
    }
    
    func outcome(of gamer: Gamer) -> OutCome {
        return .win
    }
   
    var dealerOutcome: DealerOutcome {
        let winningCount: Int = 0
        let drawCount: Int = 0
        let loseCount: Int = 0
        return DealerOutcome(winningCount: winningCount,
                             drawCount: drawCount,
                             loseCount: loseCount)
    }
}
