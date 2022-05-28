//
//  InputView.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct InputView {
    
    private enum QuestionText: UserInformable {
        case gamerNames
        case hitOrStay(gamer: Gamer)
        case bettingMoney(gamer: Gamer)
        
        var guideDescription: String {
            switch self {
            case .gamerNames:
                return "게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)"
            case let .hitOrStay(gamer):
                return "\(gamer.name)는 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)"
            case let .bettingMoney(gamer):
                return "\(gamer.name)의 배팅 금액은?"
            }
        }
    }
    
    private let userGuider = UserGuider()
    private let userInputConverter = UserInputConverter()
    
    func receiveGamers() -> [Gamer] {
        userGuider.printGuide(for: QuestionText.gamerNames)
        
        let userInput: String? = readLine()
        let gamers: [Gamer] = userInputConverter.convertToGamers(from: userInput)
        return gamers
    }
    
    func receiveToHitOrStay(of gamer: Gamer) throws -> Gamer.State {
        userGuider.printGuide(for: QuestionText.hitOrStay(gamer: gamer))
        
        let userInput: String? = readLine()
        let gamerState: Gamer.State = try userInputConverter.convertToHitOrStay(from: userInput)
        return gamerState
    }
    
    func receiveBettingMoney(of gamer: Gamer) throws -> Double {
        userGuider.printGuide(for: QuestionText.bettingMoney(gamer: gamer))
        
        let userInput: String? = readLine()
        let bettingMoney: Double = try userInputConverter.convertToBettingMoney(from: userInput)
        return bettingMoney
    }
}
