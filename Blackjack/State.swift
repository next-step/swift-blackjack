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
}

enum WinLose {
    case win
    case lose
}

class State: Statable {
    private var isHit: Bool
    private var winLoseRecord: [WinLose]
    
    init(isHit: Bool = true, winLoseRecord: [WinLose] = []) {
        self.isHit = isHit
        self.winLoseRecord = winLoseRecord
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
}
