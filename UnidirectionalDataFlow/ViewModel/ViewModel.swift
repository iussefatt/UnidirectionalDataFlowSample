//
//  ViewModel.swift
//  Test
//
//  Created by Ismael Ussefatt on 14/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ActionProtocol {}

protocol ReducerProtocol: AnyObject {
    associatedtype Mutation
    associatedtype State
    static func reduce(state: State, mutation: Mutation) -> State
}

protocol ViewModelProtocol: AnyObject {
    associatedtype Action: ActionProtocol
    associatedtype Reducer: ReducerProtocol
    associatedtype Service
    init(initialState: Reducer.State, reducer: Reducer, service: Service)
    func mutate(action: Action) -> Observable<Reducer.Mutation>
    func viewState(from action: Observable<Action>) -> Driver<Reducer.State>
}

class ViewModel<Action: ActionProtocol, Reducer: ReducerProtocol, Service>: ViewModelProtocol {

    typealias Reducer = Reducer
    typealias Action = Action
    typealias Service = Service
    
    private var initialState: Reducer.State
    private var reducer: Reducer
    private var backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    
    private(set) var service: Service
    
    required init(initialState: Reducer.State, reducer: Reducer, service: Service) {
        self.initialState = initialState
        self.reducer = reducer
        self.service = service
    }
    
    func mutate(action: Action) -> Observable<Reducer.Mutation> {
        abstractMethod()
    }
    
    func beforeMutationHandler(_ action: Action) {}

    final func viewState(from action: Observable<Action>) -> Driver<Reducer.State> {
        return action
            .do(onNext: beforeMutationHandler)
            .flatMap { [weak self] in self?.mutate(action: $0) ?? .empty() }
            .scan(initialState, accumulator: Reducer.reduce)
            .observeOn(backgroundScheduler)
            .asDriverOnErrorJustComplete()
    }
}
