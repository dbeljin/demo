//
//  ApiRequest.swift
//  DemoApp
//
//  Created by Dusan Beljin on 16.3.25..
//

import Foundation
import Alamofire

class ApiRequest {
    
    public static let GET = "GET"
    
    public static func request<T: Decodable>(fromUrl urlString: String,
                                             httpMethod: String,
                                             outType: T.Type,
                                             _ completion: @escaping ((T?, ErrorMessage?) -> ())) {
        
        
        
        
        //TODO: Delete mock after implementation
        let json = """
                {
                  "type": "page",
                  "title": "Main Page",
                  "items": [
                    {
                      "type": "section",
                      "title": "Introduction",
                      "items": [
                        {
                          "type": "text",
                          "title": "Welcome to the main page!"
                        },
                        {
                          "type": "image",
                          "src": "https://robohash.org/280?&set=set4&size=400x400",
                          "title": "Welcome Image"
                        }
                      ]
                    },
                    {
                      "type": "section",
                      "title": "Chapter 1",
                      "items": [
                        {
                          "type": "text",
                          "title": "This is the first chapter."
                        },
                        {
                          "type": "section",
                          "title": "Subsection 1.1",
                          "items": [
                            {
                              "type": "text",
                              "title": "This is a subsection under Chapter 1."
                            },
                            {
                              "type": "image",
                              "src": "https://robohash.org/100?&set=set4&size=400x400",
                              "title": "Chapter 1 Image"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "page",
                      "title": "Second Page",
                      "items": [
                        {
                          "type": "section",
                          "title": "Chapter 2",
                          "items": [
                            {
                              "type": "text",
                              "title": "This is the second chapter."
                            },
                            {
                              "type": "text",
                              "title": "What is the main topic of Chapter 2?"
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
                """
        let data = json.data(using: .utf8)!
        let decodedResponse = try? JSONDecoder().decode(T.self, from: data)
        
        completion(decodedResponse, nil)
        return
        
        guard let url = URL(string: urlString) else {
            let error = ErrorMessage(title: String(localized: "ErrorTitle"), body: "")
            completion(nil, error)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        AF.sessionConfiguration.timeoutIntervalForRequest = 10
        AF.request(urlRequest).responseData { response in
            guard let data = response.data, let decodedResponse = data.decode(T.self) else {
                let error = ErrorMessage(title: String(localized: "ErrorTitle"), body: response.error?.localizedDescription ?? "")
                completion(nil, error)
                return
            }
            completion(decodedResponse, nil)
        }
    }
}
