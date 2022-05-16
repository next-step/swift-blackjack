//
//  State.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/08.
//

import Foundation

protocol Statable {
    func hitOrStay(_ isHit: Bool)
    func record(_ winLose: WinLose)
    func giveIsHit() -> Bool
    func giveWinLoseRecord() -> [WinLose]
    func profit(isWin: Bool, isFirstHandBlackjack: Bool, isExceedWinningScore: Bool) -> Int
    func firstHandBlackjack()
    func giveIsFirstHandBlackjack() -> Bool
    func bettingAmount() -> Int
}

enum WinLose {
    case win
    case lose
}

class State: Statable {
    private var isHit: Bool
    private var isFirstHandBlackjack: Bool
    private var winLoseRecord: [WinLose]
    private var betting: BettingProtocol
    
    init(isHit: Bool = true, winLoseRecord: [WinLose] = [], bettingAmount: Int) {
        self.isHit = isHit
        self.winLoseRecord = winLoseRecord
        self.betting = Betting(amount: bettingAmount)
        self.isFirstHandBlackjack = false
    }
    
    func hitOrStay(_ isHit: Bool) {
        self.isHit = isHit
    }
    
    func record(_ winLose: WinLose) {
        winLoseRecord.append(winLose)
    }
    
    func giveIsHit() -> Bool {
        isHit
    }
    
    func giveWinLoseRecord() -> [WinLose] {
        winLoseRecord
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
