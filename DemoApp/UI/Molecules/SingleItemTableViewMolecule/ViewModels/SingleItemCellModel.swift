//
//  SingleItemCellModel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit

class SingleItemCellModel: SingleItemCellProtocol {
    var title: String = ""
    var font: UIFont = .systemFont(ofSize: 14, weight: .regular)
    var hideArrow: Bool = true
    
    init(with item: Item) {
        title = item.getTitle()
        font = getFont(for: item)
        hideArrow = item.items.orEmpty.isEmpty || item.type == .image
    }
    
    private func getFont(for item: Item) -> UIFont {
        if item.type == .section {
            return .systemFont(ofSize: 16, weight: .regular)
        }
        return .systemFont(ofSize: 14, weight: .regular)
    }
    
    
}
