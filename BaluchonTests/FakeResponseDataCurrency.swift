//
//  FakeResponseDataCurrency.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//

import Foundation

class FakeResponseDataCurrency {
        static let responseOk = HTTPURLResponse(url: URL(string: "http://api.forismatic.com/api/1.0/")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        static let responseKO = HTTPURLResponse(url: URL(string: "http://api.forismatic.com/api/1.0/")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
        class CurrencyError: Error{}
        static let error = CurrencyError()
    
    static var currencyCorrectData: Data {
        let bundle = Bundle(for: FakeResponseDataCurrency.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")
        
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let currencyIncorrectData = "erreur".data(using: .utf8)!
    static let imageData = "image".data(using: .utf8)!
}
