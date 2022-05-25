//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

import Foundation

do {
    let players = try InputView.readUserNames()
    let game = BlackjackGame(players: players)
    try game.startGame()
} catch let error as CardError {
    print(error)
} catch let error as InputError {
    print(error)
} catch let error {
    print(error.localizedDescription)
}
