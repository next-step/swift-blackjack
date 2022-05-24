//
//  Player.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

protocol Playable {
    mutating func deal(_ element: Card)
}

class Player: Playable, CustomDebugStringConvertible {
    let name: String
    var cards: Cards
    var playing: Bool
    
    var result: Int {
        cards.result()
    }
    
    var debugDescription: String {
        "\(name)카드: \(cards)"
    }
    
    init(name: String, _ cards: Cards = Cards()) {
        self.name = name
        self.cards = cards
        self.playing = true
    }
    
    func deal(_ element: Card) {
        cards.add(element)
    }
}
