//
//  TranslationServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//
@testable import ClassKit
import XCTest

class WeatherServicesTestCase: XCTestCase {

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
}
