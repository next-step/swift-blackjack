//
//  CardType.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

enum CardType: CaseIterable {
    case 클로버, 다이아, 하트, 스페이드
}

extension CardType: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .클로버: return "클로버"
        case .다이아: return "다이아"
        case .하트: return "하트"
        case .스페이드: return "스페이드"
        }
    }
}
