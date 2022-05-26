//
//  Outputview.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

enum OutputView {
    static func print(error: Error) {
        if let localizedError = error as? LocalizedError {
            Swift.print(localizedError.errorDescription ?? "")
            return
        }
        
        Swift.print(error.localizedDescription)
    }
    
    static func printIntialState(players: String, names: String) {
        Swift.print( "\(names)에게 2장씩 나누었습니다.")
        Swift.print(players)
        Swift.print("\n")
    }
    
    static func print(player: String) {
        Swift.print(player)
        Swift.print("\n")
    }
    
    static func print(playerScore: String) {
        Swift.print(playerScore)
        Swift.print("\n")
    }
}
