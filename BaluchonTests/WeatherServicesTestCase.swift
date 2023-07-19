//
//  WeatherServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
import XCTest



class WeatherServicesTestCase: XCTestCase {

    func testGetWeatherShouldPostFailedCallbackIfError() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFakeWeather(data: nil, response: nil, error: FakeResponseDataWeather.error), imageSession: URLSessionFakeWeather(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        weatherService.getWeather { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFakeWeather(data: nil, response: nil, error: nil), imageSession: URLSessionFakeWeather(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        weatherService.getWeather { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFakeWeather(data: FakeResponseDataWeather.weatherCorrectData, response: FakeResponseDataWeather.responseKO, error: nil), imageSession: URLSessionFakeWeather(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        weatherService.getWeather { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFakeWeather(data: FakeResponseDataWeather.weatherIncorrectData, response: FakeResponseDataWeather.responseOk, error: nil), imageSession: URLSessionFakeWeather(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        weatherService.getWeather { success, quote in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
    func testGetWeatherShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFakeWeather(data: FakeResponseDataWeather.weatherCorrectData, response: FakeResponseDataWeather.responseOk, error: nil), imageSession: URLSessionFakeWeather(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "wait for queue change")
        weatherService.getWeather { success, quote in
            // Then
            let feels_like = "25.5"
            let name = "paris"
            XCTAssertTrue(success)
            XCTAssertNotNil(weather)
            
            XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.01)
    }
}
