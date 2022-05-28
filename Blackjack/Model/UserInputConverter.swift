//
//  UserInputConverter.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct UserInputConverter {
    
    enum UserInputConverterError: LocalizedError {
        case invalidCardReceiveDecision
        case invalidBettingMoney
        
        var errorDescription: String? {
            switch self {
            case .invalidCardReceiveDecision:
                return "y 나 n 를 입력해주세요"
            case .invalidBettingMoney:
                return "유효하지 않은 배팅금액입니다. 0 이상의 수를 입력해주세요."
            }
        }
    }
    
    func convertToGamers(from input: String?) -> [Gamer] {
        guard let input = input,
              !input.isEmpty else {
                  return []
              }
        
        let separator: String = ","
        let gamers: [Gamer] = input.components(separatedBy: separator)
            .map { name in
                name.trimmingCharacters(in: .whitespaces)
            }
            .map { name in
                Gamer(name: name)
            }
        return gamers
    }
    
    func convertToHitOrStay(from input: String?) throws -> Gamer.State {
        
        guard let input = input,
              !input.isEmpty else {
                  throw UserInputConverter.UserInputConverterError.invalidCardReceiveDecision
              }
        
        let hitInput: String = "y"
        let stayInput: String = "n"
        
        switch input {
        case hitInput:
            return .hit
        case stayInput:
            return .stay
        default:
            throw UserInputConverter.UserInputConverterError.invalidCardReceiveDecision
        }
    }
    
    func convertToBettingMoney(from input: String?) throws -> Double {
        guard let input = input,
              let result = Double(input),
              result > 0 else {
                  throw UserInputConverter.UserInputConverterError.invalidBettingMoney
              }
        return result
    }
}

