//
//  Denomination.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

enum Denomination {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case king
    case queen
    case jack
    
    var point: Int {
        switch self {
        case .ace:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .king, .queen, .jack:
            return 10
        }
    }
    
    var addablePoint: Int {
        switch self {
        case .ace:
            return 10
        default:
            return 0
        }
    }
}
