//
//  BlackjackGame.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

struct BlackjackGame {
    private let players: [Player]
    private let cardDistributor: CardDistributor
    private let readAnswerDelegate: ReadAnswerDelegate
    private let gameStateDelegate: GameStateDelegate?
    
    init(players: [Player],
         cardDistributor: CardDistributor,
         answerReaderDelegate: ReadAnswerDelegate,
         gameStateDelegate: GameStateDelegate? = nil) throws {
        
        self.players = players
        self.cardDistributor = cardDistributor
        self.readAnswerDelegate = answerReaderDelegate
        self.gameStateDelegate = gameStateDelegate
        
        try initPlayer()
        gameStateDelegate?.afterInit(players: players)
    }
    
    private func initPlayer() throws {
        try players.forEach { player in
            let cards = try cardDistributor.distribute(count: 2)
            player.receive(cards: cards)
        }
    }
    
    func start() throws -> [BlackjackScore] {
        try players.forEach { try askAboutCard(to: $0) }
        let finalScores = players.map {
            BlackjackScore(player: $0, score: $0.countScore())
        }
        return finalScores
    }
    
    private func askAboutCard(to player: Player) throws {
        while true {
            let answer = try readAnswerDelegate.readAnswer(player: player)
            
            switch answer {
            case .yes:
                let card = try cardDistributor.distribute(count: 1)
                player.receive(cards: card)
                
                gameStateDelegate?.afterReceiveCard(player: player)
            case .no:
                return
            }
        }
    }
}
