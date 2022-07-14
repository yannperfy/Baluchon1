//
//  CurrencyServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//
@testable import ClassKit
import XCTest

class CurrencyServicesTestCase: XCTestCase {

    func testGetCurrencyShouldPostFailedCallbackIfError() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFakeCurrency(data: nil, response: nil, error: FakeResponseDataCurrency.error), imageSession: URLSessionFakeCurrency(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        currencyService.getCurrency { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
}
