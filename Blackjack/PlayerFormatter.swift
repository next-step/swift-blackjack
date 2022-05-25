//
//  PlayerFormatter.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

enum PlayerFormatter {
    static func format(names: [PlayerName]) -> String {
        return names.reduce("") { partialResult, playerName in
            partialResult + playerName.value + ","
        }
    }
    
    static func format(players: [Player]) -> String {
        return players.reduce("") { partialResult, player in
            partialResult + format(player: player) + "\n"
        }
    }
    
    static func format(player: Player) -> String {
        return "\(player.name.value)카드: \(format(cardDeck: player.cardDeck.cards))"
    }
    
    static func format(cardDeck: [Card]) -> String {
        return cardDeck.reduce("") { partialResult, card in
            partialResult + format(cardId: card.rank) + format(cardSymbol: card.symbol) + ","
        }
        
    }
    
    private static func format(cardSymbol: Card.CardSymbol) -> String {
        switch cardSymbol {
        case .heart: return "하트"
        case .spade: return "스페이드"
        case .diamond: return "다이아몬드"
        case .club: return "클로버"
        }
    }
    
    private static func format(cardId: Card.Rank) -> String {
        switch cardId {
        case .ace: return "A"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .ten: return "10"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        }
    }
}
