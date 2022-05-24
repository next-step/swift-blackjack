//
//  InputView.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

struct InputView {
    static func readUserNames() throws -> Players {
        print("게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
        
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        
        return Players(input.components(separatedBy: ",").map { (name) in
            Player(name: name.trimmingCharacters(in: .whitespaces))
        })
    }
    
    static func readDrawYesOrNo(name: String) throws -> Bool {
        print("\n\(name)는 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)")
        
        let whiteList = ["y", "n"]
        
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        
        if whiteList.contains(input) {
            return input == "y" ? true : false
        }
        
        throw InputError.invalidInput
    }
}
