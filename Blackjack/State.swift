//
//  State.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/08.
//

import Foundation

protocol Statable {
    func hitOrStay(_ isHit: Bool)
    func record(_ winLose: PlayersGameResult)
    func giveIsHit() -> Bool
    func giveWinLoseRecord() -> [PlayersGameResult]
    func profit(isWin: Bool, isFirstHandBlackjack: Bool, isExceedWinningScore: Bool) -> Int
    func firstHandBlackjack()
    func giveIsFirstHandBlackjack() -> Bool
    func bettingAmount() -> Int
}

enum PlayersGameResult {
    case win
    case lose
}

class State: Statable {
    private var isHit: Bool
    private var isFirstHandBlackjack: Bool
    private var playersGameResultRecord: [PlayersGameResult]
    private var betting: BettingProtocol
    
    init(isHit: Bool = true, playersGameResultRecord: [PlayersGameResult] = [], bettingAmount: Int) {
        self.isHit = isHit
        self.playersGameResultRecord = playersGameResultRecord
        self.betting = Betting(amount: bettingAmount)
        self.isFirstHandBlackjack = false
    }
    
    func hitOrStay(_ isHit: Bool) {
        self.isHit = isHit
    }
    
    func record(_ winLose: PlayersGameResult) {
        playersGameResultRecord.append(winLose)
    }
    
    func giveIsHit() -> Bool {
        isHit
    }
    
    func giveWinLoseRecord() -> [PlayersGameResult] {
        playersGameResultRecord
    }
    
    func bettingAmount() -> Int {
        betting.bettingAmount()
    }
    
    func firstHandBlackjack() {
        betting.firstHandBlackjack()
    }
    
    func giveIsFirstHandBlackjack() -> Bool {
        isFirstHandBlackjack
    }
    
    func profit(isWin: Bool, isFirstHandBlackjack: Bool, isExceedWinningScore: Bool) -> Int {
        betting.profit(isWin: isWin,
                       isExceedWinningScore: isExceedWinningScore)
    }
}
