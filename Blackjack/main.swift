//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum CardType {
    case hart
    case spade
    case clover
    case diamond
    case ace
    case king
    case queen
    case jack
    
    var koreanName: String {
        switch self {
        case .hart: return "하트"
        case .spade: return "스페이드"
        case .clover: return "클로버"
        case .diamond: return "다이아몬드"
        case .ace: return "에이스"
        case .king: return "킹"
        case .queen: return "퀸"
        case .jack: return "잭"
        }
    }
}

struct Card {
    let number: Int?
    let type: CardType
    
    var cardName: String {
        guard let number = number else {
            return "\(type.koreanName)"
        }
        return "\(number)\(type.koreanName)"
    }
}

protocol CardGammerInputProtocol {
    func pickCard(_ card: Card)
}

protocol CardGammerOutputProtocol {
    var cardSum: Int { get }
}

class CardGammer: CardGammerInputProtocol, CardGammerOutputProtocol {
    private var cardsHoldingInHand: [Card] = []
    var name: String
    
    var cardSum: Int {
        cardsHoldingInHand.reduce(0) { result, card in
            var cardNumber: Int
            switch card.type {
            case .king, .queen, .jack: cardNumber = 10
            case .ace: return result + 11 <= 21 ? result + 11 : result + 1
            default: cardNumber = card.number ?? 0
            }
            
            return result + cardNumber
        }
    }
    
    var cards: [Card] {
        return cardsHoldingInHand
    }
    
    init(name: String) {
        self.name = name
    }
    
    func pickCard(_ card: Card) {
        cardsHoldingInHand.append(card)
    }
}

