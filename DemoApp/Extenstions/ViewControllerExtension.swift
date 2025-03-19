//
//  ViewControllerExtension.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

import UIKit

extension UIViewController {
    
    func showSimpleAlert(title: String?, message: String?, buttonTitle: String = String(localized: "Ok"), handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: handler)
        okAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        okAction.accessibilityIdentifier = "Ok alert action"
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }
    
    func showAlert(title: String, message: String, leftButtonText: String, rightButtonText: String, cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil, actionHandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: leftButtonText, style: .cancel, handler: cancelHandler)
        cancelAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        cancelAction.accessibilityIdentifier = "Cancel alert action"
        alertController.addAction(cancelAction)
        
        let defaultAction = UIAlertAction(title: rightButtonText, style: .default, handler: actionHandler)
        defaultAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        defaultAction.accessibilityIdentifier = "Retry alert action"
        alertController.addAction(defaultAction)
        
        alertController.preferredAction = defaultAction
        
        present(alertController, animated: true)
    }
    
    var navigationBottomPosition : CGFloat { return (self.navigationController?.navigationBar.frame.height ?? 0.0) + (self.navigationController?.navigationBar.frame.origin.y ?? 0.0)
    }
}
