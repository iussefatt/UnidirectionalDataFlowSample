//
//  RxCollectionViewController.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

class RxCollectionViewController<ViewModel: ViewModelProtocol, CustomView: UIView, Section: SectionModelType>:
    RxBaseViewController<ViewModel, CustomView> {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: buildLayout())
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    lazy var dataSource = RxCollectionViewSectionedReloadDataSource<Section>(configureCell: {
        [weak self] dataSource, collectionView, indexPath, item in
        guard let self = self else { return UICollectionViewCell() }
        return self.configureCell(dataSource: dataSource, collectionView: collectionView, indexPath: indexPath, item: item)
    }, configureSupplementaryView: { [weak self] dataSource, collectionView, title, indexPath in
        guard let self = self else { return UICollectionReusableView() }
        return self.configureSupplementaryView(dataSource: dataSource, collectionView: collectionView, title: title, indexPath: indexPath)
    })
    
    func buildLayout() -> UICollectionViewCompositionalLayout {
        abstractMethod()
    }
    
    func registerCells() {
        abstractMethod()
    }
    
    func configureCell(
        dataSource: CollectionViewSectionedDataSource<Section>,
        collectionView: UICollectionView,
        indexPath: IndexPath,
        item: Section.Item) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func configureSupplementaryView(
        dataSource: CollectionViewSectionedDataSource<Section>,
        collectionView: UICollectionView,
        title: String,
        indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    override func createBindings() {
        let stateDriver = state.asDriverOnErrorJustComplete()
        
        stateDriver
            .drive(stateBinder)
            .disposed(by: disposeBag)
        
        stateDriver
            .drive(mapToSections)
            .drive(collectionView.rx.items(dataSource: dataSource))
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
