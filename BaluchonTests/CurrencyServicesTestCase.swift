//
//  CurrencyServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
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
    
    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFakeCurrency(data: nil, response: nil, error: nil), imageSession: URLSessionFakeCurrency(data: nil, response: nil, error: nil))
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
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFakeCurrency(data: FakeResponseDataCurrency.currencyCorrectData, response: FakeResponseDataCurrency.responseKO, error: nil), imageSession: URLSessionFakeCurrency(data: nil, response: nil, error: nil))
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
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFakeCurrency(data: FakeResponseDataCurrency.currencyIncorrectData, response: FakeResponseDataCurrency.responseOk, error: nil), imageSession: URLSessionFakeCurrency(data: nil, response: nil, error: nil))
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
    
    func testGetCurrencyShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let currencyService = CurrencyService(currencySession: URLSessionFakeCurrency(data: FakeResponseDataCurrency.currencyCorrectData, response: FakeResponseDataCurrency.responseOk, error: nil), imageSession: URLSessionFakeCurrency(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        currencyService.getCurrency { success, quote in
            // Then
            
            let result = "31.69002"
            XCTAssertTrue(success)
            XCTAssertNotNil(currency)
            
            XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
}
