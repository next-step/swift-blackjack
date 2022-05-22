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
        
        var errorDescription: String? {
            switch self {
            case .invalidCardReceiveDecision:
                return "y 나 n 를 입력해주세요"
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
        
        switch input {
        case "y":
            return .hit
        case "n":
            return .stay
        default:
            throw UserInputConverter.UserInputConverterError.invalidCardReceiveDecision
        }
    }
}

