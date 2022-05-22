//
//  UserInputConverterTests.swift
//  BlackjackTests
//
//  Created by 강수진 on 2022/05/22.
//

import XCTest

class UserInputConverterTests: XCTestCase {
    
    var sut: UserInputConverter!
    
    override func setUpWithError() throws {
        sut = UserInputConverter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - convertToGamers
    
    func test_convertToGamers_nil이_들어오면_빈_어레이를_반환한다() throws {
        // given
        let input: String? = nil
        
        // when
        let result = sut.convertToGamers(from: input)
        
        // then
        let expectation: [Gamer] = []
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToGamers_빈_스트링이_들어오면_빈_어레이를_반환한다() throws {
        // given
        let input = ""
        
        // when
        let result = sut.convertToGamers(from: input)
        
        // then
        let expectation: [Gamer] = []
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToGamers_쉼표로_이름을_구분해서_게이머를_반환한다() throws {
        // given
        let input = "sujin,naljin"
        
        // when
        let result = sut.convertToGamers(from: input)
        
        // then
        let expectation = [Gamer(name: "sujin"),
                           Gamer(name: "naljin")]
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToGamers_이름과_쉼표_사이에_공백이_있으면_공백은_제거한_이름으로_게이머를_반환한다() throws {
        // given
        let input = "sujin ,  naljin"
        
        // when
        let result = sut.convertToGamers(from: input)
        
        // then
        let expectation = [Gamer(name: "sujin"),
                           Gamer(name: "naljin")]
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToGamers_이름_내에_공백이_있으면_공백을_포함한_이름으로_게이머를_반환한다() throws {
        // given
        let input = "sujin naljin, naljin"
        
        // when
        let result = sut.convertToGamers(from: input)
        
        // then
        
        let expectation = [Gamer(name: "sujin naljin"),
                           Gamer(name: "naljin")]
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - convertToIsReceiveCard
    
    func test_convertToIsReceiveCard_nil이_들어오면_에러를_throw한다() throws {
        // given
        let input: String? = nil
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToIsReceiveCard(from: input))
    }
    
    func test_convertToIsReceiveCard_y_혹은_n가_아닌_값이_들어오면_에러를_throw한다() throws {
        // given
        let input = "e"
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToIsReceiveCard(from: input))
    }
    
    func test_convertToIsReceiveCard_y가_들어오면_true를_반환한다() throws {
        // given
        let input = "y"
        
        // when
        let result = try sut.convertToIsReceiveCard(from: input)
        
        // then
        let expectation = true
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToIsReceiveCard_n가_들어오면_false를_반환한다() throws {
        // given
        let input = "n"
        
        // when
        let result = try sut.convertToIsReceiveCard(from: input)
        
        // then
        let expectation = false
        XCTAssertEqual(result, expectation)
    }
}

