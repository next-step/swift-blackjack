//
//  InputView.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/06.
//

import Foundation

struct InputView {
    static func read(with description: String) -> String {
        print(description)
        let line = readLine() ?? ""
        return line
    }
    
    static func readParticipants() -> String {
        return read(with: "게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
    }
    
    static func readAskHitToParticipants(to participant: Player) -> Bool {
        let yesOrNo = read(with: "\(participant.name)는 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)")
        return yesOrNo == "y" ? true : false
    }
    
    static func readBettingAmount(to name: String) -> Int {
        let bettingAmountString = read(with: "\(name)의 배팅 금액은?") as NSString
        let bettingAmountDouble = bettingAmountString.doubleValue
        return Int(bettingAmountDouble)
    }
}
