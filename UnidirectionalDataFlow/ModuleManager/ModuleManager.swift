//
//  ModuleManager.swift
//  Test
//
//  Created by Ismael Ussefatt on 15/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ModuleManager<Builder: ModuleBuilder> {

    typealias Builder = Builder
    typealias Event = Builder.ViewModel.Event
    
    var rootViewController: UIViewController
    var builder: Builder
    var children: [ModuleManager] = []
    
    private let disposeBag = DisposeBag()
    
    private lazy var eventBinder = Binder<Event>(self) { manager, event in
        manager.handleEvent(event)
    }
    
    required init(rootViewController: UIViewController, builder: Builder) {
        self.rootViewController = rootViewController
        self.builder = builder
    }
    
    private func createBindings() {
        builder.viewModel.moduleEvent
            .asDriverOnErrorJustComplete()
            .drive(eventBinder)
            .disposed(by: disposeBag)
    }

    func handleEvent(_ event: Event) {
        abstractMethod()
    }
    
    func start() {
        createBindings()
    }
    
    func stop() {
        abstractMethod()
    }
    
    func startChild(_ child: ModuleManager) {
        children.append(child)
        child.start()
    }
    
    func stopChild(_ child: ModuleManager) {
        children.removeAll(where: { $0 === child })
        child.stop()
    }
}
