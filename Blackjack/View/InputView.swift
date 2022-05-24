//
//  InputView.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

enum InputView {
    static func readPlayerName() -> String? {
        print("게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
        return readLine()
    }
    
    static func readAnswer(from player: Player) -> String? {
        print("\(player.name.value)는 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)")
        return readLine()
    }
}
