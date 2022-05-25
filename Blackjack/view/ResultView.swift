//
//  ResultView.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

import Foundation

struct ResultView {
    static func printDistributeMessage(from: Players) {
        let names = from.customMap {
            $0.name
        }.joined(separator: ", ")
        
        print("\n\(names)에게 2장씩 나누었습니다.")
    }
    
    static func printAllPlayerCards(from players: Players) {
        print(players.customMap {
            String(describing: $0)
        }.joined(separator: "\n"))
    }
    
    static func printPlayerCards(of name: String, players: Players) {
        let cardsInfo = Players(players.customFilter {
            $0.name == name
        }).customMap {
            String(describing: $0)
        }.joined(separator: "")
        
        print(cardsInfo)
    }
    
    static func printGameResult(of players: Players) {
        print("")
        for player in players.players {
            let cardInfo = players.players.filter {
                $0.name == player.name
            }.map {
                String(describing: $0)
            }.joined(separator: "")
            
            print("\(cardInfo) - 결과: \(player.result)")
        }
    }
}
