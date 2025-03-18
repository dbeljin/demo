//
//  ActivityIndicator.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {

    init() {
        super.init(frame: CGRect.zero)
        style = .medium
        hidesWhenStopped = true
        startAnimating()
    }

    public func display(on view: UIView, considering topBarHeight: CGFloat = 0) {
        view.addSubview(self)
        self.centerInsideParent(withTopConstant: -topBarHeight)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
