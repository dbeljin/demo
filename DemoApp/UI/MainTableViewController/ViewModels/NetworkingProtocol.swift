//
//  NetworkingProtocol.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//
import Foundation

protocol NetworkingProtocol: DataStorageProtocol {
    func fetchData(completion: @escaping (_ response: Item?, _ errorMessage: ErrorMessage?) -> Void)
}
