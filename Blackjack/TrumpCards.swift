//
//  TrumpCard.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

enum TrumpCards {
    static var value: [Card] {
        return Rank.allCases
            .map { cardId in
                allCards(with: cardId, cardSymbols: CardSymbol.allCases)
            }
            .flatMap { $0 }
    }
    
    private static func allCards(with cardId: Rank, cardSymbols: [CardSymbol]) -> [Card] {
        return cardSymbols.map { symbol in
            Card(rank: cardId, symbol: symbol)
        }
    }
}
