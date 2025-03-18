//
//  UIViewExtension.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit

extension UIView {
    
    func centerInsideParent(withTopConstant: CGFloat = 0) {
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: withTopConstant).isActive = true
    }
}
