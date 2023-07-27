//
//  TranslationServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//

import XCTest

@testable import ClassTranslation

class TranslationServicesTestCase: XCTestCase {

    func testGetWeatherShouldPostFailedCallbackIfError() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFakeTranslation(data: nil, response: nil, error: FakeResponseDataWeather.error), imageSession: URLSessionFakeTranslation(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        translationService.getTranslation { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFakeTranslation(data: nil, response: nil, error:nil), imageSession: URLSessionFakeTranslation(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        translationService.getTranslation { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFakeTranslation(data: FakeResponseDataTranslation.translationCorrectData, response: FakeResponseDataTranslation.responseKO, error: nil), imageSession: URLSessionFakeTranslation(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        translationService.getTranslation { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFakeTranslation(data: FakeResponseDataTranslation.translationIncorrectData, response: nil, error:nil), imageSession: URLSessionFakeTranslation(data: nil, response: FakeResponseDataTranslation.responseOk, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        translationService.getTranslation { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }

    func testGetWeatherShouldPostSuccessCallbackIfIncorrectData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFakeTranslation(data: FakeResponseDataTranslation.translationCorrectData, response: nil, error:nil), imageSession: URLSessionFakeTranslation(data: nil, response: FakeResponseDataTranslation.responseOk, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        translationService.getTranslation { success, quote in
            // Then
            let translatedText = "My name is Jeff"
            XCTAssertTrue(success)
            XCTAssertNotNil(translation)
            
            XCTAssertEqual( translatedText , <#T##expression2: Equatable##Equatable#>)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }

}
