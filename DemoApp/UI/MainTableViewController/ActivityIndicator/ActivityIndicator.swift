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
        style = .large
        hidesWhenStopped = true
        color = .systemBlue
        startAnimating()
    }

    public func display(on view: UIView, considering topBarHeight: CGFloat = 0) {
        view.addSubview(self)
        centerInsideParent(withTopConstant: -topBarHeight)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func startAnimating() {
        super.startAnimating()
        superview?.bringSubviewToFront(self)
        superview?.isUserInteractionEnabled = false
    }
    
    override func stopAnimating() {
        super.stopAnimating()
        superview?.isUserInteractionEnabled = true
    }
}
