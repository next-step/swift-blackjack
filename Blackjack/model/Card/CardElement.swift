//
//  CardElement.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

enum CardElement: CaseIterable {
    case two, three, four, five, six, seven, eight, nine, ten
    case king, queen, jack, ace
    
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

extension CardElement: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .ten: return "10"
        case .king: return "K"
        case .queen: return "Q"
        case .jack: return "J"
        case .ace: return "A"
        }
    }
}
