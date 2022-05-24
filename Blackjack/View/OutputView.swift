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
    
    static func print(initialPlayers: String) {
        Swift.print(initialPlayers)
    }
}
