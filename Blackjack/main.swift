//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let cardPack = BlackjackCard.arrangeCards()
let dealer = Dealer(cardPack: cardPack)
let inputView = InputView()
let resultView = ResultView()
let blackjackGame = BlackjackGame(dealer: dealer, inputable: inputView, presentable: resultView)
blackjackGame.start()
