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
        case .클로버: return "♣"
        case .다이아: return "◆"
        case .하트: return "♥"
        case .스페이드: return "♠"
        }
    }
}
