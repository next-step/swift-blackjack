//
//  PlayerNameParserTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

class PlayerNameParserTest: XCTestCase {

    func test_콤마를_기준으로_이름을_분리한다() {
        // given
        let nameInput = "yagom,coma"
        // when
        let names = PlayerNameParser.parse(nameInput: nameInput)
        
        // then
        XCTAssertTrue(names.contains(Name("yagom")))
        XCTAssertTrue(names.contains(Name("coma")))
    }

}
