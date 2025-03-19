//
//  DataUtil.swift
//  DemoApp
//
//  Created by Dusan Beljin on 19.3.25..
//

import Foundation

class DataUtil {
    
    @discardableResult
    public func saveResponseIntoFile<T: Codable>(filename: String, response: T) -> Bool {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(filename)
                .appendingPathExtension("json")
            
            try JSONEncoder()
                .encode(response)
                .write(to: fileURL)
            return true
        } catch {
            print("error saving data")
            return false
        }
    }
    
    public func readDataFrom<T: Codable>(fileName: String, usingObjectType: T.Type) -> T? {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileName)
                .appendingPathExtension( "json" )
            
            let data = try Data(contentsOf: fileURL)
            let pastData = try JSONDecoder().decode(T.self, from: data)
            
            return pastData
        } catch {
            print("error reading data")
            return nil
        }
    }
    
    public func getItemResponse() -> Item? {
        readDataFrom(fileName: Constants.itemResponseFileName, usingObjectType: Item.self)
    }
}
