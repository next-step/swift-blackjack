//
//  CardElement.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

enum CardElement: String, CaseIterable {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case king = "K"
    case queen = "Q"
    case jack = "J"
    case ace = "A"
    
    var point: Int {
        switch self {
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
        case .king, .queen , .jack, .ten:
            return 10
        case .ace:
            return 11
        }
    }
}
