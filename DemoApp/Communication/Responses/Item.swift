//
//  Item.swift
//  DemoApp
//
//  Created by Dusan Beljin on 16.3.25..
//

struct Item: Codable {
    let type: ItemType
    let title: String?
    let src: String?
    let items: [Item]?
}

enum ItemType: String, Codable {
    case page
    case section
    case text
    case image
    case unknown
    
    public init(rawValue: String) {
        switch rawValue {
        case ItemType.page.rawValue: self = .page
        case ItemType.section.rawValue: self = .section
        case ItemType.text.rawValue: self = .text
        case ItemType.image.rawValue: self = .image
        default: self = .unknown
        }
    }
}
