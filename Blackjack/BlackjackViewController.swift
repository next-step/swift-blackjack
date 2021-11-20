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

struct BlackjackOutputView {
    func printCards(in gammer: CardGammer, isPrintResult: Bool = false) {
        let names = gammer.cards
            .map { $0.cardName }
            .joined(separator: ", ")
        
        guard isPrintResult else {
            print("\(gammer.name)카드: \(names)")
            return
        }

        print("\(gammer.name)카드: \(names) - 결과: \(gammer.cardSum)")
    }
    
    func printDistributedTwoCards(_ gammerNames: [String]) {
        let names = gammerNames.joined(separator: ", ")
        print("\(names)에게 2장씩 나누었습니다.")
    }
}

