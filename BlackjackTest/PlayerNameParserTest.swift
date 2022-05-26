//
//  PlayerNameParserTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

class PlayerNameParserTest: XCTestCase {

    func test_콤마를_기준으로_이름을_분리한다() throws {
        // given
        let nameInput = "yagom,coma"
        // when
        let names = try PlayerNameParser.parse(nameInput: nameInput)
        
        // then
        XCTAssertTrue(names.contains { $0.value == "yagom" })
        XCTAssertTrue(names.contains { $0.value == "coma" })
    }
    
    func test_콤마를_기준으로_이름을_분리했을때_이름이_존재하지_않을경우_error를_throw한다() {
        // given
        let nameInput = " , "
            
        // when
        // then
        XCTAssertThrowsError(try PlayerNameParser.parse(nameInput: nameInput))
    }

}
