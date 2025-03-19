//
//  MainTableViewController.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var viewModel: MainTableViewProtocol = MainTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.uiObserver = self
        viewModel.setupTableView(tableView, navigationBottomPosition)
    }
    
    private func showFullSizeImage(_ storyBoard: UIStoryboard, _ item: Item) {
        let largeImageViewController = storyBoard.instantiateViewController(withIdentifier: "FullImage") as! LargeImageViewController
        largeImageViewController.imageObject = item
        pushViewController(largeImageViewController)
    }
    
    private func showNestedItems(_ storyBoard: UIStoryboard, _ item: Item) {
        let mainTableViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! MainTableViewController
        mainTableViewController.viewModel = MainTableViewModel(item: item)
        pushViewController(mainTableViewController)
    }
    
    private func pushViewController(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getNumberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.getCell(for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewModel.viewForHeader(in: section)
    }
    
}

extension MainTableViewController: UIObserver {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showAlert(title: String, description: String) {
        showAlert(title: title,
                  message: description,
                  leftButtonText: String(localized: "Cancel"),
                  rightButtonText: String(localized: "Retry"),
                  actionHandler: { [weak self] _ in
                      self?.viewModel.retryFetching()
                  })
    }
    
    func showInformationalAlert(title: String, description: String) {
        showSimpleAlert(title: title, message: description)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func openItem(_ item: Item) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if item.type == .image {
            showFullSizeImage(storyBoard, item)
            return
        }
        showNestedItems(storyBoard, item)
    }
}
