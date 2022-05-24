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
}
