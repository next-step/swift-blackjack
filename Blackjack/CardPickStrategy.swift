//
//  CardPickStrategy.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

protocol CardPickStrategy {
    func pick<Cards>(among cards: Cards) -> Card?
    where Cards: Collection, Cards.Element == Card
}


struct RandomCardPickStrategy: CardPickStrategy {
    func pick<Cards>(among cards: Cards) -> Card? where Cards : Collection, Cards.Element == Card {
        return cards.randomElement()
    }
}
