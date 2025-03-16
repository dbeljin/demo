//
//  ErrorMessage.swift
//  DemoApp
//
//  Created by Dusan Beljin on 16.3.25..
//


public class ErrorMessage: Codable {
    let title: String
    let body: String
    
    public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
