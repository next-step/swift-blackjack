//
//  Card.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct Card {
    let shape: CardShape
    let number: CardNumber
    
    var description: String {
        return "\(number.description)\(shape.description)"
    }
    
    var value: Int {
        switch number {
        case .ace: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .jack, .queen, .king: return 10
        }
    }
    
    static func generateRandomCard() throws -> Card {
        let randomShapePool: [CardShape] = CardShape.allCases
        let randomNumberPool: [CardNumber] = CardNumber.allCases
        
        guard let randomShape = randomShapePool.randomElement() else { throw BlackjackError.failedGenerateCard }
        guard let randomNumber = randomNumberPool.randomElement() else { throw BlackjackError.failedGenerateCard }
        
        return Card(shape: randomShape, number: randomNumber)
    }
}

enum CardShape: CaseIterable {
    case spade
    case diamond
    case heart
    case clover
    
    var description: String {
        switch self {
        case .spade: return "스페이드"
        case .diamond: return "다이아"
        case .heart: return "하트"
        case .clover: return "클로버"
        }
    }
}

enum CardNumber: CaseIterable {
    case ace
    case two, three, four, five, six, seven, eight, nine
    case jack, queen, king
    
    var description: String {
        switch self {
        case .ace: return "A"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        }
    }
}
