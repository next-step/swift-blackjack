//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let game = Game()
    game.receiveGamers()
    
    let resultView = ResultView()
    resultView.printDistributeCards(to: game.gamers)
    
    try game.distributeTwoCardsToEachGamer()
    resultView.printCards(of: game.gamers)
   
    try game.gamers.forEach { gamer in
        while gamer.state == .hit {
            try game.decideToHitOrStay(of: gamer)
            try game.distributeCardIfStateIsHit(to: gamer)
            resultView.printCards(of: gamer)
        }
    }
    
    resultView.printScore(of: game.gamers)
} catch {
    let errorView = ErrorView()
    errorView.printError(for: error)
}
