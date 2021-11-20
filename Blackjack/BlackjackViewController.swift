//
//  BlackjackViewController.swift
//  Blackjack
//
//  Created by 남기범 on 2021/11/20.
//

import Foundation

struct BlackjackInputView {
    enum InputError: Error {
        case notInputYorN
    }
    
    func inputGammerName() -> String {
        print("게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
        return readLine() ?? ""
    }

    func inputIsPick(name: String) throws -> Bool {
        print("\(name)는 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n")
        guard let input = readLine() else { throw InputError.notInputYorN }
        
        switch input {
        case "y": return true
        case "n": return false
        default: throw InputError.notInputYorN
        }
    }
}
