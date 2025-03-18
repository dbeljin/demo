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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension MainTableViewController: UIObserver {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showAlert(title: String, description: String) {
        showAlert(title: title, message: description)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func openItem(_ item: Item) {
        //TODO: Go to next page should be implemented
        
    }
}
