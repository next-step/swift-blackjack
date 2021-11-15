//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let dealer = Dealer()
let inputView = InputView()
let resultView = ResultView()
let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
blackjackGame.start()
