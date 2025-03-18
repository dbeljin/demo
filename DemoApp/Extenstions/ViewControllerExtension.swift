//
//  ViewControllerExtension.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, leftButtonText: String, rightButtonText: String, leftHandler: ((UIAlertAction) -> Swift.Void)? = nil, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: leftButtonText, style: .cancel, handler: leftHandler)
        cancelAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        cancelAction.accessibilityIdentifier = "Cancel alert action"
        alertController.addAction(cancelAction)
        
        let retryAction = UIAlertAction(title: rightButtonText, style: .default, handler: handler)
        retryAction.setValue(UIColor.systemBlue, forKey: "titleTextColor")
        retryAction.accessibilityIdentifier = "Retry alert action"
        alertController.addAction(retryAction)
        
        alertController.preferredAction = retryAction
        
        present(alertController, animated: true)
    }
    
    var navigationBottomPosition : CGFloat { return (self.navigationController?.navigationBar.frame.height ?? 0.0) + (self.navigationController?.navigationBar.frame.origin.y ?? 0.0)
    }
}
