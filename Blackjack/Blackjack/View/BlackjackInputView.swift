//
//  BlackjackInputView.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/27.
//

import Foundation

struct BlackjackInputView {
    func readParticipantNames() -> [String]? {
        guard let input = readInput(with: "게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)") else { return nil }
        print()
        
        let participantNames = input.components(separatedBy: ",")
        return participantNames
    }
    
    private func readInput(with comment: String) -> String? {
        print(comment)
        let input = readLine()
        return input
    }
}
