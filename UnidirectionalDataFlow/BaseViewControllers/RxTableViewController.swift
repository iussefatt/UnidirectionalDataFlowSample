//
//  RxTableViewController.swift
//  UnidirectionalDataFlow
//
//  Created by Ismael Ussefatt on 16/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

class RxTableViewController<ViewModel: ViewModelProtocol, CustomView: UIView, Section: SectionModelType>:
    RxBaseViewController<ViewModel, CustomView> {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    lazy var dataSource = RxTableViewSectionedReloadDataSource<Section>(configureCell: {
        [weak self] dataSource, tableView, indexPath, item in
        guard let self = self else { return UITableViewCell() }
        return self.configureCell(dataSource: dataSource, tableView: tableView, indexPath: indexPath, item: item)
    })
    
    func registerCells() {
        abstractMethod()
    }
    
    func configureCell(
        dataSource: TableViewSectionedDataSource<Section>,
        tableView: UITableView,
        indexPath: IndexPath,
        item: Section.Item) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func createBindings() {
        let stateDriver = state.asDriverOnErrorJustComplete()
        
        stateDriver
            .drive(stateBinder)
            .disposed(by: disposeBag)
        
        stateDriver
            .drive(mapToSections)
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        viewModel.viewState(from: Observable.merge(createActions()))
            .drive(state)
            .disposed(by: disposeBag)
    }
    
    func mapToSections(_ state: Observable<State>) -> Driver<[Section]> {
        .empty()
    }
    
    override func viewDidLoad() {
        registerCells()
        super.viewDidLoad()
    }
}

