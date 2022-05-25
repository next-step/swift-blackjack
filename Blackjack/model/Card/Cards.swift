//
//  Cards.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

struct Cards {
    var cards: [Card]
    
    var count: Int {
        cards.count
    }
    
    init(_ cards: [Card] = []) {
        self.cards = cards
    }

    private var aceCount: Int {
        cards.filter {
            $0.cardElement == .ace
        }.count
    }
    
    private var sum: Int {
        cards.map {
            $0.point
        }.reduce(0, +)
    }
    
    func result() -> Int {
        func findNearWinningNumber(count aceCount: Int, expectedResult: Int) -> Int {
            if aceCount == 0 || Constants.winningNumber >= expectedResult {
                return expectedResult
            }
            return findNearWinningNumber(count: aceCount - 1, expectedResult: expectedResult - 10)
        }

        return findNearWinningNumber(count: aceCount, expectedResult: sum)
    }
    
    mutating func add(_ element: Card) {
        cards.append(element)
    }
}

extension Cards: CustomDebugStringConvertible {
    var debugDescription: String {
        cards.map { (card) in
            String(describing: card)
        }.joined(separator: ", ")
    }
}
