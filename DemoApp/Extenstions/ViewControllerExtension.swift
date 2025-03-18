//
//  ViewControllerExtension.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, buttonTitle: String = String(localized: "Ok"), handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .default, handler: handler)
        alertAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        alertAction.accessibilityIdentifier = "Ok alert action"
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
    
    var navigationBottomPosition : CGFloat { return (self.navigationController?.navigationBar.frame.height ?? 0.0) + (self.navigationController?.navigationBar.frame.origin.y ?? 0.0)
    }
}
