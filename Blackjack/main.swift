//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let game = Game()
    game.receiveGamers()
    
    let gamePlayView = GamePlayView()
    gamePlayView.printDistributeCards(to: game.allPlayers)
    
    try game.distributeTwoCardsToEveryone()
    gamePlayView.printCards(of: game.allPlayers)
    
    try game.gamers.forEach { gamer in
        while gamer.state == .hit && !gamer.isBurst {
            try game.decideToHitOrStay(of: gamer)
            try game.distributeCardIfStateIsHit(to: gamer)
            gamePlayView.printCards(of: gamer)
        }
    }
    
    if game.dealer.isNeedToGetMoreCard {
        gamePlayView.printDealer()
        try game.distributeCardToDealder()
    }
    
    let gameResult = GameResult(dealer: game.dealer, gamers: game.gamers)
    let resultView = ResultView(gameResult: gameResult)
    resultView.printScore(of: game.allPlayers)
    resultView.printFinalOutcome(with: game.gamers)
} catch {
    let errorView = ErrorView()
    errorView.printError(for: error)
}
