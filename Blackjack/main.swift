//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    let rawParticipansts = InputView.readParticipants()
    let participantNames = StringUtility.splitWithComma(to: rawParticipansts)
    guard let cardDeck = CardDeck(cards: CardDeckGenerator.generate()) else { return }
    cardDeck.shuffle()
    guard let players = Players(with: participantNames, cardDeck: cardDeck) else { return }
    
    let game = BlackjackGame(players: players)
    let controller = BlackjackGameContrller(with: game)
    
    ResultView.printGameStart(nameOfParticipants: rawParticipansts)
    controller.noticeHandOfPlayers { participant in
        ResultView.printPlayer(player: participant)
    }
    
    while game.isPlayingGame() {
        guard let turnToPlayer = game.turnToPlayer() else { return }
        let hitOrStay = InputView.readAskHitToParticipants(to: turnToPlayer)
        turnToPlayer.hitOrStay(hitOrStay)

        game.turnForPlayer { turnToPlayer in
            ResultView.printPlayer(player: turnToPlayer)
        }
    }
    
    controller.noticeResultOfGame { participant in
        ResultView.printGameResult(player: participant)
    }
}

main()


