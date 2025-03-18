//
//  SingleItemCellProtocol.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit

protocol SingleItemCellProtocol {
    var title: String { get set }
    var font: UIFont { get set }
    var hideArrow: Bool { get set }
}
