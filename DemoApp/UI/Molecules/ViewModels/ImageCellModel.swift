//
//  ImageCellModel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

class ImageCellModel: ImageCellProtocol {
    var url: String?
    
    init(url: String?) {
        self.url = url
    }
}
