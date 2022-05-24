//
//  Card+Extension.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.denomination == rhs.denomination && lhs.suit == rhs.suit
    }
}
