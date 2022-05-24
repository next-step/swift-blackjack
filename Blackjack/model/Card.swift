//
//  Card.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

enum CardError: Error {
    case outOfValue
}

enum CardType: String, CaseIterable {
    case 클로버, 다이아, 하트, 스페이드
}

enum CardElement: String, CaseIterable {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case king = "K"
    case queen = "Q"
    case jack = "J"
    case ace = "A"
    
    var point: Int {
        switch self {
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .king, .queen , .jack, .ten:
            return 10
        case .ace:
            return 11
        }
    }
}

struct Card: CustomDebugStringConvertible {
    let cardType: CardType
    let cardElement: CardElement
    
    var point: Int {
        cardElement.point
    }
    
    var debugDescription: String {
        cardElement.rawValue + cardType.rawValue
    }
    
    init(_ cardType: CardType, _ cardElement: CardElement) {
        self.cardType = cardType
        self.cardElement = cardElement
    }
}

class Cards: CustomDebugStringConvertible {
    var cards: [Card]
    
    var count: Int {
        cards.count
    }
    
    var debugDescription: String {
        String(describing: cards)
    }
    
    init(_ cards: [Card] = []) {
        self.cards = cards
    }

    private var aceCount: Int {
        cards.filter {
            $0.cardElement == .ace
        }.count
    }
    
    private var sum: Int {
        cards.map {
            $0.point
        }.reduce(0, +)
    }
    
    func result() -> Int {
        func findNearWinningNumber(count aceCount: Int, expectedResult: Int) -> Int {
            if aceCount == 0 || Constants.winningNumber >= expectedResult {
                return expectedResult
            }
            return findNearWinningNumber(count: aceCount - 1, expectedResult: expectedResult - 10)
        }

        return findNearWinningNumber(count: aceCount, expectedResult: sum)
    }
    
    func add(_ element: Card) {
        cards.append(element)
    }
}
