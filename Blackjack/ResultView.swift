//
//  ResultView.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/05.
//

import Foundation

struct ResultView {
    static func printGameStart(nameOfParticipants: String) {
        print("딜러와 \(nameOfParticipants)에게 2장씩 나누었습니다.")
    }
    
    static func printPlayer(player: Playable) {
        print("\(player.giveName())의 카드: \(player.giveHandDescription())")
    }
    
    static func printGameResult(player: Playable) {
        print("\(player.giveName())의 카드: \(player.giveHandDescription()) - 결과: \(player.score())")
    }
    
    static func printHitDlear() {
        print("딜러는 16이하라 한장의 카드를 더 받았습니다.")
    }
    
    static func printWinOrLoseTitle() {
        print("## 최종 승패")
    }
    
    static func printWinOrLose(player: Playable) {
        print("\(player.giveName()): \(player.giveWinLoseRecord())")
    }
}
