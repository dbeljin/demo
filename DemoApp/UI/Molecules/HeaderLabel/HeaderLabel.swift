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
    
    public init(with title: String, and font: UIFont) {
        super.init(frame: .zero)
        numberOfLines = 0
        text = title
        self.font = font
        backgroundColor = .systemBlue
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
