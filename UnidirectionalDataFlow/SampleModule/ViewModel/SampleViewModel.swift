//
//  ViewModel.swift
//  Test
//
//  Created by Ismael Ussefatt on 11/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum SampleError: Error, Equatable {
    case any
}

class SampleViewModel: ViewModel<SampleAction, SampleReducer, SampleServiceProtocol>, ModuleManagerEventSender {
    
    typealias Event = RootModuleEvent
    var moduleEvent = PublishRelay<RootModuleEvent>()
    
    override func mutate(action: SampleAction) -> Observable<SampleMutation> {
        switch action {
        case .start:
            return service
                .getUsers()
                .mapToMutation()
                .startWith(.loadUsers(.loading))
                .catchErrorJustReturn(.loadUsers(.error(SampleError.any)))
        
        case .showDetail:
            return .empty()
        }
    }
    
    override func beforeMutationHandler(_ action: SampleAction) {
        switch action {
        case .showDetail:
            moduleEvent.accept(.showSeasonDetail)
        default:
            break
        }
    }
}

extension Observable where Element == [UserResponse] {
    func mapToMutation() -> Observable<SampleMutation> {
        map { response in
            .loadUsers(.success(response.map { User(from: $0) }))
        }
    }
}
