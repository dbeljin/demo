//
//  DataStorageProtocol.swift
//  DemoApp
//
//  Created by Dusan Beljin on 19.3.25..
//

protocol DataStorageProtocol {
    func saveData<T: Codable>(_ data: T) -> Bool
    func loadData<T: Codable>(_ type: T.Type) -> T?
}
