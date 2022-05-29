//
//  MoneyTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/29.
//

import XCTest

class MoneyTest: XCTestCase {
    func test_Money는_음수를_입력받으면_nil을_반환한다() {
        // given
        let negativeNumber = -1

        // when
        let money = Money(value:negativeNumber)

        // then
        XCTAssertNil(money)
    }
}
