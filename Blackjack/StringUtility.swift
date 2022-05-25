//
//  StringUtility.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/06.
//

import Foundation

struct StringUtiltity {
    static func splitParticipantsName(to convertedExpression: String) -> [String] {
        convertedExpression.components(separatedBy: ",")
    }
}
