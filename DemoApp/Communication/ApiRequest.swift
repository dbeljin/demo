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
    
    public static func request<T: Codable>(fromUrl urlString: String,
                                             httpMethod: String,
                                             outType: T.Type,
                                             _ completion: @escaping ((T?, ErrorMessage?) -> ())) {
        
        guard let url = URL(string: urlString) else {
            let error = ErrorMessage(title: String(localized: "ErrorTitle"), body: "")
            completion(nil, error)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.timeoutInterval = Constants.timeoutInterval
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
