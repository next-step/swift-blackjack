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
    
    try game.distributeTwoCardsToEachGamer()
    let gamePlayView = GamePlayView()
   gamePlayView.printDistributeCards(to: game.allPlayers)

   gamePlayView.printCards(of: game.allPlayers)
   
    try game.gamers.forEach { gamer in
        while gamer.state == .hit {
            try game.decideToHitOrStay(of: gamer)
            try game.distributeCardIfStateIsHit(to: gamer)
            gamePlayView.printCards(of: gamer)
        }
    }
    
    resultView.printScore(of: game.gamers)
} catch {
    let errorView = ErrorView()
    errorView.printError(for: error)
}
