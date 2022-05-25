//
//  CardError.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

import Foundation

enum CardError: LocalizedError {
    case outOfValue
    case noCards
    
    var errorDescription: String {
        switch self {
        case .outOfValue: return "가진 패의 합이 \(Constants.winningNumber)를 초과했습니다"
        case .noCards: return "더 뽑을 카드가 없습니다"
        }
    }
}
