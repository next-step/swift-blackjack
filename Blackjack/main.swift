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
   
    while(game.isRemainHitGamer) {
        try game.gamers
            .filter { $0.state == .hit }
            .forEach { gamer in
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
