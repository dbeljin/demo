//
//  MainTableViewModel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//
import UIKit

class MainTableViewModel: MainTableViewProtocol {
    
    private var tableView: UITableView!
    public var networking: NetworkingProtocol = NetworkingModel()
    public weak var uiObserver: UIObserver?
    private var response: Item?
    private let activityIndicator = ActivityIndicator()
    
    func setupTableView(_ tableView: UITableView, _ topBarHeight: CGFloat) {
        tableView.registerNib(cellClass: SingleItemTableViewCell.self)
        tableView.registerNib(cellClass: ImageTableViewCell.self)
        self.tableView = tableView
        activityIndicator.display(on: tableView, considering: topBarHeight)
        fetchData()
    }
    
    fileprivate func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() , execute: {
            self.networking.fetchData { [weak self] response, errorMessage in
                self?.activityIndicator.stopAnimating()
                if let response = response {
                    self?.handleSussccesfulResponse(response)
                    return
                }
                self?.showAlert(errorMessage)
            }
        })
    }
    
    private func handleSussccesfulResponse(_ response: Item) {
        self.response = response
        uiObserver?.setTitle(response.getTitle())
        uiObserver?.reloadData()
    }
    
    private func showAlert(_ message: ErrorMessage?) {
        guard let message = message else {
            uiObserver?.showAlert(title: String(localized: "ErrorTitle"),
                                  description: String(localized: "ErrorMessage"))
            return
        }
        uiObserver?.showAlert(title: message.title, description: message.body)
    }
    
    private func getTopLevelItems() -> [Item] {
        guard let response = response, let items = response.items else {
            return []
        }
        return items
    }
    
    private func getSingleItemCell(for indexPath: IndexPath, using item: Item) -> SingleItemTableViewCell {
        let cell: SingleItemTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(using: SingleItemCellModel(with: item))
        return cell
    }
    
    private func getImageCell(for indexPath: IndexPath, using item: Item) -> ImageTableViewCell {
        let cell: ImageTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(using: ImageCellModel(url: item.src))
        return cell
    }
    
    
    // MARK: - Protocol methods
    func getNumberOfSections() -> Int {
        getTopLevelItems().count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        getTopLevelItems()[section].items.orEmpty.count
    }
    
    func getCell(for indexPath: IndexPath) -> UITableViewCell {
        let currentItem = getTopLevelItems()[indexPath.section].items![indexPath.row]
        if currentItem.type == .image {
            return getImageCell(for: indexPath, using: currentItem)
        }
        return getSingleItemCell(for: indexPath, using: currentItem)
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let selectedItem = getTopLevelItems()[indexPath.section].items![indexPath.row]
        uiObserver?.openItem(selectedItem)
    }
}
