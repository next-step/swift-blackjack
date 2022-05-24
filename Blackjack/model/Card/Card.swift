//
//  Card.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/22.
//

struct Card: CustomDebugStringConvertible {
    let cardType: CardType
    let cardElement: CardElement
    
    var point: Int {
        cardElement.point
    }
    
    var debugDescription: String {
        return String(describing: cardType) + String(describing: cardElement)
    }
    
    init(_ cardType: CardType, _ cardElement: CardElement) {
        self.cardType = cardType
        self.cardElement = cardElement
    }
}
