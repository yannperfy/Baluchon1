//
//  FakeResponseDataTranslation.swift
//  BaluchonTests
//
//  Created by Yann Perfy on 27/06/2022.
//

import Foundation
class FakeResponseDataTranslation {
    
        static let responseOk = HTTPURLResponse(url: URL(string: "https://translation.googleapis.com/language/translate/v2?")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        static let responseKO = HTTPURLResponse(url: URL(string: "https://translation.googleapis.com/language/translate/v2?")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
        class TranslationError: Error{}
        static let error = TranslationError()
    
    static var translationCorrectData: Data {
        let bundle = Bundle(for: FakeResponseDataTranslation.self)
        let url = bundle.url(forResource: "Translation", withExtension: "json")
        
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let translationIncorrectData = "erreur".data(using: .utf8)!
    static let imageData = "image".data(using: .utf8)!
}
