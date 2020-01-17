//
//  RxBaseViewController.swift
//  Test
//
//  Created by Ismael Ussefatt on 20/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa

class RxBaseViewController<ViewModel: ViewModelProtocol, CustomView: UIView>: LoadableViewController<CustomView> {
    
    typealias State = ViewModel.Reducer.State
    typealias Action = ViewModel.Action
    
    var viewModel: ViewModel
    var disposeBag = DisposeBag()
    var state = PublishSubject<State>()
    
    lazy var stateBinder = Binder<State>(self) { controller, state in
        controller.updateState(state)
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBindings() {
        state.asDriverOnErrorJustComplete()
            .drive(stateBinder)
            .disposed(by: disposeBag)
        
        viewModel.viewState(from: Observable.merge(createActions()))
            .drive(state)
            .disposed(by: disposeBag)
    }
    
    func updateState(_ state: State) {}
    
    func createActions() -> [Observable<Action>] {
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBindings()
    }
}
