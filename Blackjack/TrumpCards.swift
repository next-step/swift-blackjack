//
//  TrumpCard.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/23.
//

import Foundation

enum TrumpCards {
    static var value: [Card] {
        return Card.Rank.allCases
            .map { cardId in
                allCards(with: cardId, cardSymbols: Card.CardSymbol.allCases)
            }
            .flatMap { $0 }
    }
    
    private static func allCards(with cardId: Card.Rank, cardSymbols: [Card.CardSymbol]) -> [Card] {
        return cardSymbols.map { symbol in
            Card(rank: cardId, symbol: symbol)
        }
    }
}
