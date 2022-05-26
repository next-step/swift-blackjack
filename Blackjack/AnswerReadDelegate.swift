//
//  AnswerReadDelegate.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

protocol ReadAnswerDelegate {
    func readAnswer(player: Player) throws -> Answer
}

struct BlackjackAnswerReader: ReadAnswerDelegate {
    func readAnswer(player: Player) throws -> Answer {
        if let dealer = player as? Dealer {
            let score = dealer.countScore()
            return score <= 16 ? .yes: .no
        }
        let answerInput = InputView.readAnswer(from: player)
        let answer = try AnswerParser.parse(answerInput: answerInput)
        return answer
    }
}
