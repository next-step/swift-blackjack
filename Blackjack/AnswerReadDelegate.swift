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
        let answerInput = InputView.readAnswer(from: player)
        let answer = try AnswerParser.parse(answerInput: answerInput)
        return answer
    }
}
