//
//  BlackjackStateDelegate.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

protocol GameStateDelegate {
    func afterInit(players: [Player])
    func afterReceiveCard(player: Player)
}

