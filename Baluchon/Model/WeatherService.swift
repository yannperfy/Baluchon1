//
//  WeatherService.swift
//  Baluchon
//
//  Created by Yann Perfy on 18/06/2022.
//

import Foundation

class WeatherService {
    static var shared = WeatherService()
    private init() {}
    private static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
    private let appid = "9a386b6bc09f6242c939cba9ff20a57c"
    
    private var task: URLSessionDataTask?
    private var weatherSession = URLSession(configuration: .default)
    
    init(weatherSession: URLSession = .shared) {
        self.weatherSession = weatherSession
    }
    
    func getWeather(name: String, callback: @escaping (Bool, Weather?) -> Void ) {
        let units = "metric"
        
        let feelsLike = "feels_like"
        let tempMin = "temp_min"
        let tempMax = "temp_max"
        let lang = "fr"
        
        guard let url = URL(string: "\(WeatherService.baseUrl)&appid=\(appid)&feelsLike=\(feelsLike)&tempMin=\(tempMin)&tempMax=\(tempMax)&units=\(units)&lang=\(lang)&q=\(name)") else {
            callback(false, nil)
            return
        }
        
        task?.cancel()
        
        task = weatherSession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil,
                      let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                
                guard let weatherData: Weather = try? JSONDecoder().decode(Weather.self, from: data) else {
                    callback(false, nil)
                    return
                }
            
                
                callback(true, weatherData)
            }
        }
        task?.resume()
    }
}
