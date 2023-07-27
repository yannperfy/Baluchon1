//
//  TranslationService.swift
//  Baluchon
//
//  Created by Yann Perfy on 18/06/2022.
//

import Foundation


//https://translation.googleapis.com/language/translate/v2?
//key=AIzaSyDdgwS_svJd7zlu9i-WSOHWab-lUr1Hdqk&
//q=Je m'appel Yannick&
//source=fr&
//target=en

class TranslationService {

    static let shared = TranslationService()
    private init() {}
    
    private let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?")!
    
    private var task: URLSessionDataTask?
    private var translationSession = URLSession(configuration: .default)
    
    init(translationSession: URLSession) {
        self.translationSession = translationSession
    }
    func getTranslation(q: String, callback: @escaping (Bool, Translation?) -> Void ) {
        let key = "AIzaSyDdgwS_svJd7zlu9i-WSOHWab-lUr1Hdqk"
        let source = "fr"
        let target = "en"
        

        var request = URLRequest(url: translationUrl)
        request.httpMethod = "POST"
       
        let body = "&key=\(key)&source=\(source)&target=\(target)&q=\(q)"
        request.httpBody = body.data(using: .utf8)
        
    task?.cancel()
       let task = translationSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil,
                      let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                
                guard let translationData = try? JSONDecoder().decode(Translation.self, from: data) else {
                    callback(false, nil)
                    return
                }
            
                print(translationData)
                callback(true, translationData)
                
            }
            
            
            
        }
         task.resume()
    }
    
}
