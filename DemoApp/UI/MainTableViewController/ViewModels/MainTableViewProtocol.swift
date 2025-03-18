//
//  MainTableViewProtocol.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//
import UIKit

protocol MainTableViewProtocol {
    var uiObserver: UIObserver? { get set }
    func setupTableView(_ tableView: UITableView, _ topBarHeight: CGFloat)
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    func getCell(for indexPath: IndexPath) -> UITableViewCell
    func didSelectRow(at indexPath: IndexPath)
}
