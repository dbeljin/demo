//
//  DataExtension.swift
//  DemoApp
//
//  Created by Dusan Beljin on 16.3.25..
//

import Foundation

extension Data {
    public func decode<T: Decodable>(_ type: T.Type) -> T? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let resp = try decoder.decode(type, from: self)
            return resp
        } catch {
            print("\(String(decoding: self, as: UTF8.self)) - \(error.localizedDescription)")
        }
        return nil
    }
}
