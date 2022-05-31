//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let nameInput = InputView.readPlayerName()
    let names = try PlayerNameParser.parse(nameInput: nameInput)
    
    let moneyInputs = names.map { InputView.readBettingMoney(of: $0) }
    let moneys = try moneyInputs.map { try MoneyParser.parse($0) }
    
    let players = zip(names, moneys)
        .map { Player(name: $0, cardDeck: BlackjackCardDeck(), bettingMoney: $1) }
    let dealer = Dealer(cardDeck: BlackjackCardDeck())
    let blackjackPlayers = players + [dealer]
    
    let cardDistributor = NonDuplicateCardDistributor(cards: TrumpCards.value, cardPickStrategy: RandomCardPickStrategy())
    let answerReader = BlackjackAnswerReader()
    let gameStateDelegate = BlackjackStateDelegate()
    
    let blackjack = try BlackjackGame(players: blackjackPlayers,
                                      cardDistributor: cardDistributor,
                                      answerReaderDelegate: answerReader,
                                      gameStateDelegate: gameStateDelegate)
    
    let scores = try blackjack.start()
    let formattedScores = BlackjackScoreFormatter.format(scores: scores)
    OutputView.print(playerScore: formattedScores)
    
    
    let winLoseResults = BlackjackGameJudge().winLoseResults(of: scores.playerScores, comparingWith: scores.dealerScore!)
    let profits = try ProfitCalculator.calculate(with: winLoseResults)
    let formattedProfits = ProfitsFormatter.format(profits: profits)
    OutputView.print(profits: formattedProfits)
} catch(let error) {
    OutputView.print(error: error)
}

struct BlackjackStateDelegate: GameStateDelegate {
    func afterReceiveCard(player: Player) {
        if player is Dealer {
            OutputView.printDealerReceiveCard()
            return
        }
        
        let formattedPlayer = PlayerFormatter.format(player: player)
        OutputView.print(player: formattedPlayer)
    }
    
    func afterInit(players: [Player]) {
        let formattedPlayer = PlayerFormatter.format(players: players)
        let names = players.map { $0.name }
        let formattedNames = PlayerFormatter.format(names: names)
        OutputView.printIntialState(players: formattedPlayer, names: formattedNames)
    }
}
