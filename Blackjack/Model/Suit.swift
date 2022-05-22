//
//  Suit.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

enum Suit: CaseIterable, UserInformable {
    case heart
    case diamond
    case club
    case spade
    
    var guideDescription: String {
        switch self {
        case .heart:
            return "하트"
        case .diamond:
            return "다이아몬드"
        case .club:
            return "클로버"
        case .spade:
            return "스페이드"
        }
    }
}
