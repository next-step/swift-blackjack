//
//  MoneyParserTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/29.
//

import XCTest

class MoneyParserTest: XCTestCase {

    func test_parse_양의정수가_입력되면_해당값을_갖는_Money인스턴스를_반환한다() {
        // given
        let number = "0"

        // when
        let money = try! MoneyParser.parse(number)
        
        // then
        XCTAssertEqual(Int(number), money.value)
    }
}
