//
//  CurrencyService.swift
//  Baluchon
//
//  Created by Yann Perfy on 17/06/2022.
//

import Foundation



class CurrencyService {
    //https://api.apilayer.com/fixer/convert?to=USD&from=EUR&amount=10&apikey=o0wY1eqiYBoqRITzxC62wYDFHFML7u0N
    // apikey = o0wY1eqiYBoqRITzxC62wYDFHFML7u0N
    // from = EUR
    // to = USD
    // amount = 10
    // base = https://api.apilayer.com/fixer/convert?
    
    
    func getCurrency() {
        // Créer une task
        // Créer une session
        // Créer la request
        // Lancer l'appel avec la task
    }
    static var shared =     CurrencyService()
    private init() {}
    private static let baseUrl = "https://api.apilayer.com/fixer/convert?"
    
    private var task: URLSessionDataTask?
    private var currencySession = URLSession(configuration: .default)
    
    init(curenncySession: URLSession) {
        self.currencySession = curenncySession
    }
    
    func getCurrency(amount: String, callback: @escaping (Bool, Currency?) -> Void ) {
        let apikey = "o0wY1eqiYBoqRITzxC62wYDFHFML7u0N"
        let from = "USD"
        let to = "EUR"
        
      
        
        guard let url = URL(string: "\(CurrencyService.baseUrl)&apikey=\(apikey)&from=\(from)&to=\(to)&amount=\(amount)") else {
            callback(false, nil)
            return
        }
        task?.cancel()
        task = currencySession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil,
                      let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                
                guard let currencyData: Currency = try? JSONDecoder().decode(Currency.self, from: data) else {
                    callback(false, nil)
                    return
                }
            
                
                callback(true, currencyData)
                
            }
            
            
            
        }
        task?.resume()
    }
    
}

