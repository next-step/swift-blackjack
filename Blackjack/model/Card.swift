//
//  Card.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

enum CardType: String, CaseIterable {
    case 클로버, 다이아, 하트, 스페이드
}

enum CardElement: String, CaseIterable {
    case king = "K"
    case queen = "Q"
    case jack = "J"
    case ace = "A"
    case ten = "10"
    case nine = "9"
    case eight = "8"
    case seven = "7"
    case six = "6"
    case five = "5"
    case four = "4"
    case three = "3"
    case two = "2"
    
    func point(aceFlag: Bool = false) -> Int {
        switch self {
        case .ace where aceFlag:
            return 1
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
        cardElement.point()
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
    
    var random: Card {
        cards[Int.random(in: Constants.cardRange)]
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func totalSum() -> Int {
        let aceCount = cards.map {
            $0.cardElement == .ace
        }.count
        
        return cards.map {
            $0.point
        }.reduce(0, +)
    }

    
    func append(_ element: Card) {
        cards.append(element)
    }
}
