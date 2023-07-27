//
//  FakeResponseDataWeather.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//

import Foundation
class FakeResponseDataWeather {
        static let responseOk = HTTPURLResponse(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        static let responseKO = HTTPURLResponse(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
        class WeatherError: Error{}
        static let error = WeatherError()
    
    static var weatherCorrectData: Data {
        let bundle = Bundle(for: FakeResponseDataWeather.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")
        
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let weatherIncorrectData = "erreur".data(using: .utf8)!
    static let imageData = "image".data(using: .utf8)!
}
