//
//  HeaderLabel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit

class HeaderLabel: UILabel {

    var edgeInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: edgeInset.top, left: edgeInset.left, bottom: edgeInset.bottom, right: edgeInset.right)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + edgeInset.left + edgeInset.right, height: size.height + edgeInset.top + edgeInset.bottom)
    }
    
    public init(with item: Item) {
        super.init(frame: .zero)
        numberOfLines = 0
        text = item.getTitle()
        let font: UIFont = item.type == .page ? .systemFont(ofSize: 36) : .systemFont(ofSize: 24)
        self.font = font
        backgroundColor = UIColor(named: "headerViewColor")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
