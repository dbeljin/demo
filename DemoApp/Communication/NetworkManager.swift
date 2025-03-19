//
//  NetworkManager.swift
//  DemoApp
//
//  Created by Dusan Beljin on 19.3.25..
//

import Foundation
import Alamofire

public class NetworkManager {
    
    public static let sharedInstance = NetworkManager()
    private let reachabilityHost: String = "www.google.com"
        
    public func isNetworkReachable() -> Bool {
        let reachabilityManager = Alamofire.NetworkReachabilityManager(host: reachabilityHost)
        guard let manager = reachabilityManager else {
            return false
        }
        return manager.isReachable
    }
}
