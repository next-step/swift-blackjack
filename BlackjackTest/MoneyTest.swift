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
    
    func test_나누기는_두_moneyValue값을_나눈_몫에해당하는_정수를_반환한다() {
        // given
        let lhsMoney = Money(value: 111)!
        let rhsMoney = Money(value: 10)!
        
        // when
        let result = lhsMoney / rhsMoney
        
        XCTAssertEqual(result, 111 / 10)
    }
}
