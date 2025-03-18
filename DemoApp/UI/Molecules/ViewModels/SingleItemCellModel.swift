//
//  SingleItemCellModel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

class SingleItemCellModel: SingleItemCellProtocol {
    var title: String = ""
    var hideArrow: Bool = true
    
    init(with item: Item) {
        title = item.getTitle()
        hideArrow = item.items.orEmpty.isEmpty
    }
    
    
}
