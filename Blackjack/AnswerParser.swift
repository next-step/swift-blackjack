//
//  AnswerParser.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

enum AnswerParser {
    enum Error: LocalizedError {
        case invalid
        
        var errorDescription: String? {
            switch self {
            case .invalid: return "응답은 y, n 둘 중에 하나여야 합니다."
            }
        }
    }
    
    static func parse(answerInput: String?) throws -> Answer {
        guard let answer = Answer.allCases
                        .filter({ $0.rawValue == answerInput })
                        .first else { throw Error.invalid }
                
        return answer
    }
}
