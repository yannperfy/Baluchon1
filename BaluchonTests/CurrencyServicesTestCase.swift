//
//  CurrencyServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
import XCTest
@testable import Baluchon


class CurrencyServicesTestCase: XCTestCase {

    func testGetCurrencyShouldPostFailedCallbackIfError() {
        // Given
        let currencyService = CurrencyService(
            curenncySession: URLSessionFakeCurrency(
                data: nil,
                response: nil,
                error: FakeResponseDataCurrency.error
            )
        )
        // When
       
        currencyService.getCurrency(amount: "") { success, currency in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(currency)
          
        }
     
    }

    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
        // Given
        let currencyService = CurrencyService(
            curenncySession: URLSessionFakeCurrency(
                data: nil,
                response: nil,
                error: nil
            )
        )
        // When
   
        currencyService.getCurrency(amount: "") { success, currency in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            
        }
     
    }

    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let currencyService = CurrencyService(
            curenncySession: URLSessionFakeCurrency(
                data: FakeResponseDataCurrency.currencyCorrectData,
                response: FakeResponseDataCurrency.responseKO,
                error: nil
            )
        )
        // When
        
        currencyService.getCurrency(amount: "") { success, currency in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(currency)
           
        }
       
    }

    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let currencyService = CurrencyService(
            curenncySession: URLSessionFakeCurrency(
                data: FakeResponseDataCurrency.currencyIncorrectData,
                response: FakeResponseDataCurrency.responseOk,
                error: nil
            )
        )
        // When
      
        currencyService.getCurrency(amount: "") { success, currency in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(currency)
            
        }
     
    }

    func testGetCurrencyShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let currencyService = CurrencyService(
            curenncySession: URLSessionFakeCurrency(
                data: FakeResponseDataCurrency.currencyCorrectData,
                response: FakeResponseDataCurrency.responseOk,
                error: nil
            )
        )
        // When
      
        currencyService.getCurrency(amount: "") { success, currency in
            // Then

            let result = "31.69002"
            XCTAssertTrue(success)
            XCTAssertNotNil(currency)

        }
    }
}
