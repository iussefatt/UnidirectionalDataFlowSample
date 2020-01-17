//
//  SampleModuleManager.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa

class RootBuilder: ModuleBuilder {
    
    typealias Input = ()
    typealias ViewModel = SampleViewModel

    var viewModel = SampleViewModel(
        initialState: .loading,
        reducer: SampleReducer(),
        service: SampleService(provider: RequestProvider<SampleTargetType>())
    )
    
    func build(with input: ()) -> UIViewController {
        return UINavigationController(rootViewController: SampleViewController(viewModel: viewModel))
    }
}

class RootModuleManager: ModuleManager<RootBuilder> {

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init(rootViewController: UIViewController(), builder: RootBuilder())
    }
    
    required init(rootViewController: UIViewController, builder: Builder) {
        fatalError("init(rootViewController:builder:) has not been implemented")
    }
    
    override func start() {
        window.backgroundColor = .black
        rootViewController = builder.build(with: ())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        super.start()
    }
    
    override func handleEvent(_ event: RootModuleEvent) {
        switch event {
        case .showSeasonDetail:
            let vc = UIViewController()
            vc.view.backgroundColor = .secondarySystemBackground
            rootViewController.present(vc, animated: true)
        }
    }
}
