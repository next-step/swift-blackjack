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
        let money = Money(negativeNumber)

        // then
        XCTAssertNil(money)
    }
    
    func test_더하기는_두_money의_value값을_더한값을_반환한다() {
        // given
        let lhsMoney = Money(111)!
        let rhsMoney = Money(10)!
        
        // when
        let result = lhsMoney + rhsMoney
        
        XCTAssertEqual(result.value, Money(111 + 10)!.value)
    }
    
    func test_blackjackWinningMoney_블랙잭일경우에_얻을수있는_일점오배의_돈을_반환한다() {
        // given
        guard let money = Money(111),
              let blackjackWinningMoney = Money(166) else {
                  XCTFail()
                  return
              }
        
        // when
        let result = money.blackjackWinningMoney()
        
        // then
        XCTAssertEqual(result, blackjackWinningMoney)
    }
}
