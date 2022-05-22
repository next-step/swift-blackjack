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
    case King = "K"
    case Queen = "Q"
    case Jack = "J"
    case Ace = "A"
    case Ten = "10"
    case Nine = "9"
    case Eight = "8"
    case Seven = "7"
    case Six = "6"
    case Five = "5"
    case Four = "4"
    case Three = "3"
    case Two = "2"
}

struct Card: CustomDebugStringConvertible {
    let cardType: CardType
    let cardElement: CardElement
    
    var debugDescription: String {
        cardElement.rawValue + cardType.rawValue
    }
    
    init(_ type: CardType, _ type2: CardElement) {
        self.cardType = type
        self.cardElement = type2
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
    
    func append(_ element: Card) {
        cards.append(element)
    }
}
