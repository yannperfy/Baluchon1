//
//  TranslationServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//

import XCTest

@testable import Baluchon

class TranslationServicesTestCase: XCTestCase {

    func testGetWeatherShouldPostFailedCallbackIfError() {
        // Given
        let translationService = TranslationService(
            translationSession: URLSessionFakeTranslation(
                data: nil,
                response: nil,
                error: FakeResponseDataWeather.error
   )
        )
        // When
        translationService.getTranslation(q: "") { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
          
        }
        
    }

    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFakeTranslation(
            data: nil,
         response: nil,
          error:nil

     )
        )
        // When
        
        translationService.getTranslation(q: "") { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
        }
    }

    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let translationService = TranslationService(
        translationSession: URLSessionFakeTranslation(
            data: FakeResponseDataTranslation.translationCorrectData,
         response: FakeResponseDataTranslation.responseKO,
         error: nil
        )
        )
        // When
      
        translationService.getTranslation(q: "") { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
          
        }
     
    }

    func testGetWeatherShouldPostFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let translationService = TranslationService(
            translationSession: URLSessionFakeTranslation(
        data: FakeResponseDataTranslation.translationIncorrectData,
           response: nil,
           error:nil
     )
        )
        // When
        translationService.getTranslation(q: "") { success, translation in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(translation)
        
        }
        
    }

    func testGetWeatherShouldPostSuccessCallbackIfIncorrectData() {
        // Given
        let translationService = TranslationService(
    translationSession: URLSessionFakeTranslation(
     data: FakeResponseDataTranslation.translationCorrectData,
     response: nil,
     error:nil
      )
        )
        // When
      
        translationService.getTranslation(q: "") { success, translation in
            // Then
             XCTAssertTrue(success)
            XCTAssertNotNil(translation)

          
        }
       
    }

}
