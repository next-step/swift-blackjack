//
//  Card.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

struct Card {
    let cardType: CardType
    let cardElement: CardElement
    
    var point: Int {
        cardElement.point
    }
    
    init(_ cardType: CardType, _ cardElement: CardElement) {
        self.cardType = cardType
        self.cardElement = cardElement
    }
}

extension Card: CustomDebugStringConvertible {
    var debugDescription: String {
        return String(describing: cardElement) + String(describing: cardType)
    }
}
