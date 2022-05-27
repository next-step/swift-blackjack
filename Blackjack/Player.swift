//
//  Player.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

class Player {
    private let name: String
    var hand: HandProtocol
    var state: Statable
    
    init(hand: HandProtocol = Hand(), name: String, bettingAmount: Int = 0) {
        self.hand = hand
        self.name = name
        self.state = State(bettingAmount: bettingAmount)
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
        
        if score() == WinningScore.number {
            state.firstHandBlackjack()
        }
    }
    
    func score() -> Int {
        hand.score()
    }
    
    func record(_ winLose: WinLose, amount: Int?) {
        state.record(winLose)
    }
    
    func giveWinLoseRecord() -> String {
        guard let winLose = state.giveWinLoseRecord().last else { return "" }
        return winLose == .win ? "승" : "패"
    }
    
    func betting() -> Int {
        state.bettingAmount()
    }
    
    func profit() -> Int {
        state.profit(isWin: isWin(),
                     isFirstHandBlackjack: isFirstHandBlackjack(),
                     isExceedWinningScore: isExceedWinningScore())
    }
    
    private func isWin() -> Bool {
        guard let winLose = state.giveWinLoseRecord().last else { return false }
        return winLose == .win ? true : false
    }
    
    private func isExceedWinningScore() -> Bool {
        hand.isExceedWinningScore()
    }
    
    private func isFirstHandBlackjack() -> Bool {
        state.giveIsFirstHandBlackjack()
    }
}
