//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let blackjackController = BlackjackController()

do {
    try blackjackController.playGame()
} catch {
    print("Error! \(error)")
}
