//
//  AnswerParserTest.swift
//  BlackjackTest
//
//  Created by nylah.j on 2022/05/24.
//

import XCTest

class AnswerParserTest: XCTestCase {
    func test_parse_yes() throws {
        // given
        let answerInput = "y"
        
        // when
        let answer = AnswerParser.parse(answerInput: answerInput)
        
        // then
        XCTAssertEqual(answer, Answer.yes)
    }
    
    func test_parse_no() throws {
        // given
        let answerInput = "n"
        
        // when
        let answer = AnswerParser.parse(answerInput: answerInput)
        
        // then
        XCTAssertEqual(answer, Answer.no)
    }
    
    func test_parse_정해진_answer의_rawvalue값이_들어오지않으면_error를_throw한다() throws {
        // given
        let answerInput = " "
        
        // when
        // then
        XCTAssertThrowsError(try AnswerParser.parse(answerInput: answerInput))
    }
}
