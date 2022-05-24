//
//  Gamer+Extension.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

extension Gamer: Equatable {
    static func == (lhs: Gamer, rhs: Gamer) -> Bool {
        lhs.name == rhs.name
    }
}
