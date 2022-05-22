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
    
    // MARK: - convertToHitOrStay
    
    func test_convertToHitOrStay_nil이_들어오면_invalidCardReceiveDecision_에러를_throw한다() throws {
        // given
        let input: String? = nil
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.invalidCardReceiveDecision
        XCTAssertThrowsError(try sut.convertToHitOrStay(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError, expectation)
        }
    }
    
    func test_convertToHitOrStay_y_혹은_n가_아닌_값이_들어오면_invalidCardReceiveDecision_에러를_throw한다() throws {
        // given
        let input = "e"
        
        // when
        // then
        let expectation = UserInputConverter.UserInputConverterError.invalidCardReceiveDecision
        XCTAssertThrowsError(try sut.convertToHitOrStay(from: input)) { error in
            XCTAssertEqual(error as? UserInputConverter.UserInputConverterError, expectation)
        }
    }
    
    func test_convertToHitOrStay_y가_들어오면_hit을_반환한다() throws {
        // given
        let input = "y"
        
        // when
        let result = try sut.convertToHitOrStay(from: input)
        
        // then
        let expectation = Gamer.State.hit
        XCTAssertEqual(result, expectation)
    }
    
    func test_convertToHitOrStay_n가_들어오면_stay를_반환한다() throws {
        // given
        let input = "n"
        
        // when
        let result = try sut.convertToHitOrStay(from: input)
        
        // then
        let expectation = Gamer.State.stay
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - errorDescription
    
    func test_errorDescription_convertToIsReceiveCard에_y_혹은_n가_아닌_값이_들어올때() throws {
        // given
        let input = "e"
        
        // when
        // then
        XCTAssertThrowsError(try sut.convertToHitOrStay(from: input)) { error in
            let result = (error as? UserInputConverter.UserInputConverterError)?.localizedDescription
            let expectation = "y 나 n 를 입력해주세요"
            XCTAssertEqual(result, expectation)
        }
    }
}

