//
//  CardType.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

enum CardType: CaseIterable {
    case clover, diamond, heart, spade
}

extension CardType: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .clover: return "클로버"
        case .diamond: return "다이아"
        case .heart: return "하트"
        case .spade: return "스페이드"
        }
    }
}
