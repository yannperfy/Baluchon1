//
//  WeatherServicesTestCase.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
import XCTest
@testable import Baluchon

class WeatherServicesTestCase: XCTestCase {

    func testGetWeatherShouldPostFailedCallbackIfError() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFakeWeather(
                data: nil,
                response: nil,
                error: FakeResponseDataWeather.error
            )
        )
        // When
        weatherService.getWeather(name: "") { success, weather in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weather)
        }
    }
    
    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFakeWeather(
                data: nil,
                response: nil,
                error: nil
            )
        )
        // When
        weatherService.getWeather(name: "") { success, weather in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weather)
        }
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFakeWeather(
                data: FakeResponseDataWeather.weatherCorrectData,
                response: FakeResponseDataWeather.responseKO,
                error: nil
            )
        )
        // When
        weatherService.getWeather(name: "") { success, weather in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weather)
        }
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFakeWeather(
                data: FakeResponseDataWeather.weatherIncorrectData,
                response: FakeResponseDataWeather.responseOk,
                error: nil
            )
        )
        // When
        weatherService.getWeather(name: "") { success, weather in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weather)
        }
    }
    
    func testGetWeatherShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFakeWeather(
                data: FakeResponseDataWeather.weatherCorrectData,
                response: FakeResponseDataWeather.responseOk,
                error: nil
            )
        )
        // When
        weatherService.getWeather(name: "") { success, weather in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(weather)
        }
    }
}
