//
//  ModuleManagerProtocol.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ModuleManagerEvent {}

enum RootModuleEvent: ModuleManagerEvent {
    case showSeasonDetail
}

protocol ModuleManagerEventSender {
    associatedtype Event
    var moduleEvent: PublishRelay<Event> { get }
}

protocol ModuleBuilder {
    associatedtype Input
    associatedtype ViewModel: ModuleManagerEventSender
    var viewModel: ViewModel { get }
    func build(with input: Input) -> UIViewController
}

protocol ModuleManagerProtocol {
    associatedtype Builder: ModuleBuilder
    init(rootViewController: UIViewController, builder: Builder)
    var children: [Self] { get }
    func handleEvent(_ event: Builder.ViewModel.Event)
    func start()
    func stop()
    func startChild(_ child: Self)
    func stopChild(_ child: Self)
}
