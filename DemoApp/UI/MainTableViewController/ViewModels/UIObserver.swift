//
//  UIObserver.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

protocol UIObserver: AnyObject {
    func setTitle(_ title: String)
    func showAlert(title: String, description: String)
    func showInformationalAlert(title: String, description: String)
    func reloadData()
    func openItem(_ item: Item)
}
