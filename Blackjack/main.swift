//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    let rawParticipansts = InputView.readParticipants()
    let nameOfParticipants = StringUtility.splitParticipantsName(to: rawParticipansts)
    var profileOfParticipant: [ProfileOfParticipant] = []
    
    nameOfParticipants.forEach { name in
        let bettingAmount = InputView.readBettingAmount(to: name)
        profileOfParticipant.append((name, bettingAmount))
    }
    
    guard let cardDeck = CardDeck(cards: CardDeckGenerator.generate()) else { return }
    cardDeck.shuffle()
    guard let players = Players(with: profileOfParticipant, cardDeck: cardDeck) else { return }
    
    let game = BlackjackGame(players: players)
    let controller = BlackjackGameContrller(with: game)
    
    ResultView.printGameStart(nameOfParticipants: rawParticipansts)
    controller.noticeHandOfPlayers { participant in
        ResultView.printPlayer(player: participant)
    }
    
    controller.noticeTurnOfGame { participant in
        ResultView.printPlayer(player: participant)
    }
    
    controller.noticeResultOfGame { player in
        ResultView.printGameResult(player: player)
    }
    
    ResultView.printProfitTitle()
    controller.noticeWinnerOfGame { player in
        ResultView.printWinOrLose(player: player)
    }
}

main()
