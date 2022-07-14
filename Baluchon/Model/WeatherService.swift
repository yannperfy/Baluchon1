//
//  WeatherService.swift
//  Baluchon
//
//  Created by Yann Perfy on 18/06/2022.
//

import Foundation
class WeatherService {
    static var shared =     WeatherService()
    private init() {}
    private static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
    
    private var task: URLSessionDataTask?
    
    func getWeather(name: String, callback: @escaping (Bool, Weather?) -> Void ) {
        let appid = "9a386b6bc09f6242c939cba9ff20a57c"
        let lat = "48.856614"
        let lon = "2.3522219"
        let units = "metric"
       
        
        let feelsLike = "feels_like"
        let tempMin = "temp_min"
        let tempMax = "temp_max"
        let lang = "fr"
        
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: "\(WeatherService.baseUrl)&lat=\(lat)&lon=\(lon)&appid=\(appid)&feelsLike=\(feelsLike)&tempMin=\(tempMin)&tempMax=\(tempMax)&units=\(units)&lang=\(lang)") else {
            callback(false, nil)
            return
        }
        task?.cancel()
        task = session.dataTask(with: url) { (data, response, error) in
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
    
    func getWeather2(name: String, callback: @escaping (Bool, Weather?) -> Void ) {
        let appid = "9a386b6bc09f6242c939cba9ff20a57c"
        let lat2 = "40.712784"
        let lon2 = "-74.005941"
        let units2 = "metric2"
       
        
        let feelsLike2 = "feels_like"
        let tempMin2 = "temp_min"
        let tempMax2 = "temp_max"
        let lang2 = "en"
        
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: "\(WeatherService.baseUrl)&lat2=\(lat2)&lon2=\(lon2)&appid=\(appid)&feelsLike2=\(feelsLike2)&tempMin2=\(tempMin2)&tempMax2=\(tempMax2)&units2=\(units2)&lang2=\(lang2)") else {
            callback(false, nil)
            return
        }
        task?.cancel()
        task = session.dataTask(with: url) { (data, response, error) in
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
