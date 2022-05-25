//
//  TrumpCardsTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/23.
//

import XCTest

class TrumpCardsTest: XCTestCase {

    func test_TrumpCards는_트럼프카드규칙대로_카드를갖는다() {
        // given
        let heartAce = Card(rank: .ace, symbol: .heart)
        let heartTwo = Card(rank: .two, symbol: .heart)
        let heartThree = Card(rank: .three, symbol: .heart)
        let heartFour = Card(rank: .four, symbol: .heart)
        let heartFive = Card(rank: .five, symbol: .heart)
        let heartSix = Card(rank: .six, symbol: .heart)
        let heartSeven = Card(rank: .seven, symbol: .heart)
        let heartEight = Card(rank: .eight, symbol: .heart)
        let heartNine = Card(rank: .nine, symbol: .heart)
        let heartTen = Card(rank: .ten, symbol: .heart)
        let heartJack = Card(rank: .jack, symbol: .heart)
        let heartQueen = Card(rank: .queen, symbol: .heart)
        let heartKing = Card(rank: .king, symbol: .heart)
        
        let clubAce = Card(rank: .ace, symbol: .club)
        let clubTwo = Card(rank: .two, symbol: .club)
        let clubThree = Card(rank: .three, symbol: .club)
        let clubFour = Card(rank: .four, symbol: .club)
        let clubFive = Card(rank: .five, symbol: .club)
        let clubSix = Card(rank: .six, symbol: .club)
        let clubSeven = Card(rank: .seven, symbol: .club)
        let clubEight = Card(rank: .eight, symbol: .club)
        let clubNine = Card(rank: .nine, symbol: .club)
        let clubTen = Card(rank: .ten, symbol: .club)
        let clubJack = Card(rank: .jack, symbol: .club)
        let clubQueen = Card(rank: .queen, symbol: .club)
        let clubKing = Card(rank: .king, symbol: .club)
        
        let diamondAce = Card(rank: .ace, symbol: .diamond)
        let diamondTwo = Card(rank: .two, symbol: .diamond)
        let diamondThree = Card(rank: .three, symbol: .diamond)
        let diamondFour = Card(rank: .four, symbol: .diamond)
        let diamondFive = Card(rank: .five, symbol: .diamond)
        let diamondSix = Card(rank: .six, symbol: .diamond)
        let diamondSeven = Card(rank: .seven, symbol: .diamond)
        let diamondEight = Card(rank: .eight, symbol: .diamond)
        let diamondNine = Card(rank: .nine, symbol: .diamond)
        let diamondTen = Card(rank: .ten, symbol: .diamond)
        let diamondJack = Card(rank: .jack, symbol: .diamond)
        let diamondQueen = Card(rank: .queen, symbol: .diamond)
        let diamondKing = Card(rank: .king, symbol: .diamond)
        
        
        
        // then
        XCTAssertTrue(TrumpCards.value.contains(heartAce))
    }

}
