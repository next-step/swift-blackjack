//
//  CardPickStrategy.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

protocol CardPickStrategy {
    func pick(among cards: [Card]) -> Card
}


struct RandomCardPickStrategy: CardPickStrategy {
    func pick(among cards: [Card]) -> Card {
        let range = cards.startIndex..<cards.endIndex
        let randomIndex = Int.random(in: range)
        return cards[randomIndex]
    }
}
