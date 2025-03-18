//
//  OptionalExtension.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

extension Optional where Wrapped: Collection {
    public var orEmpty: any Collection {
        switch self {
        case .some(let collection):
            return collection
        case .none:
            return []
        }
    }
}
