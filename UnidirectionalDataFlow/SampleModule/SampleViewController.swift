//
//  ViewController.swift
//  Test
//
//  Created by Ismael Ussefatt on 03/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

class SampleViewController: RxTableViewController<SampleViewModel, SampleView, SampleSection> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Premier league winners"
    }
    
    override func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: .cellIdentifier)
    }
    
    override func createActions() -> [Observable<SampleAction>] {
        return [
            .just(.start),
            tableView.rx.itemSelected.mapToAction(.showDetail)
        ]
    }
    
    override func configureCell(
        dataSource: TableViewSectionedDataSource<SampleSection>,
        tableView: UITableView,
        indexPath: IndexPath,
        item: SampleSectionItem) -> UITableViewCell {
        switch item {
        case .season(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: .cellIdentifier) ?? UITableViewCell()
            cell.textLabel?.text = model.winnerName
            cell.detailTextLabel?.text = model.year
            return cell
        }
    }
    
    override func mapToSections(_ state: Observable<State>) -> Driver<[SampleSection]> {
        state.mapToSections().debug()
    }
    
    override func updateState(_ state: State) {
        switch state {
        case .success, .empty:
            containerView.indicatorView.stopAnimating()
        
        case .error(let error):
            containerView.indicatorView.stopAnimating()
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        
        case .loading:
            containerView.indicatorView.startAnimating()
        }
    }
}

private extension String {
    static let cellIdentifier = "basicCell"
}
