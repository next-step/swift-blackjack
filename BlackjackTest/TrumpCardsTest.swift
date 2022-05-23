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
        let heartAce = Card(id: .ace, symbol: .heart)
        let heartTwo = Card(id: .two, symbol: .heart)
        let heartThree = Card(id: .three, symbol: .heart)
        let heartFour = Card(id: .four, symbol: .heart)
        let heartFive = Card(id: .five, symbol: .heart)
        let heartSix = Card(id: .six, symbol: .heart)
        let heartSeven = Card(id: .seven, symbol: .heart)
        let heartEight = Card(id: .eight, symbol: .heart)
        let heartNine = Card(id: .nine, symbol: .heart)
        let heartTen = Card(id: .ten, symbol: .heart)
        let heartJack = Card(id: .jack, symbol: .heart)
        let heartQueen = Card(id: .queen, symbol: .heart)
        let heartKing = Card(id: .king, symbol: .heart)
        
        let clubAce = Card(id: .ace, symbol: .club)
        let clubTwo = Card(id: .two, symbol: .club)
        let clubThree = Card(id: .three, symbol: .club)
        let clubFour = Card(id: .four, symbol: .club)
        let clubFive = Card(id: .five, symbol: .club)
        let clubSix = Card(id: .six, symbol: .club)
        let clubSeven = Card(id: .seven, symbol: .club)
        let clubEight = Card(id: .eight, symbol: .club)
        let clubNine = Card(id: .nine, symbol: .club)
        let clubTen = Card(id: .ten, symbol: .club)
        let clubJack = Card(id: .jack, symbol: .club)
        let clubQueen = Card(id: .queen, symbol: .club)
        let clubKing = Card(id: .king, symbol: .club)
        
        let diamondAce = Card(id: .ace, symbol: .diamond)
        let diamondTwo = Card(id: .two, symbol: .diamond)
        let diamondThree = Card(id: .three, symbol: .diamond)
        let diamondFour = Card(id: .four, symbol: .diamond)
        let diamondFive = Card(id: .five, symbol: .diamond)
        let diamondSix = Card(id: .six, symbol: .diamond)
        let diamondSeven = Card(id: .seven, symbol: .diamond)
        let diamondEight = Card(id: .eight, symbol: .diamond)
        let diamondNine = Card(id: .nine, symbol: .diamond)
        let diamondTen = Card(id: .ten, symbol: .diamond)
        let diamondJack = Card(id: .jack, symbol: .diamond)
        let diamondQueen = Card(id: .queen, symbol: .diamond)
        let diamondKing = Card(id: .king, symbol: .diamond)
        
        
        
        // then
        XCTAssertTrue(TrumpCards.value.contains(heartAceg))
    }

}
