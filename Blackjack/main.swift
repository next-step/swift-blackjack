//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let blackjackController = BlackjackController()

do {
    try blackjackController.startGame()
} catch {
    print("Error! \(error)")
}
