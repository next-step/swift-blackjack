//
//  Score.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

enum Score {
    static func from(rank: Rank, aceUsingOne: Bool = false) -> Int {
        switch rank {
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .ten: return 10
        case .A where aceUsingOne: return 1
        case .J: return 10
        case .Q: return 10
        case .K: return 10
        case .A: return 11
        }
    }
}
