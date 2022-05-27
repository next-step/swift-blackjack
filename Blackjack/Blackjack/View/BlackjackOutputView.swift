//
//  BlackjackOutputView.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct BlackjackOutputView {
    
    func printStartStat(of game: Blackjack) {
        let names = game.participants
            .compactMap({ $0.name })
        
        print("\(names.joined(separator: ", "))에게 2장씩 나누었습니다.")
        
        game.participants.forEach {
            printCards(of: $0)
        }
        print()
    }
    
    func printCards(of participant: Participant, isNewLine: Bool = true) {
        let name = participant.name
        let cardDescriptions = participant.cards
            .compactMap({ $0.description })
        
        print("\(name)카드: \(cardDescriptions.joined(separator: ", "))", terminator: isNewLine ? "\n" : " ")
    }
    
    func printResults(of game: Blackjack) {
        print()
        game.participants.forEach {
            printCards(of: $0, isNewLine: false)
            print("- 결과: \($0.score)")
        }
    }
}
