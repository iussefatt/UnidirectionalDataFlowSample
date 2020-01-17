//
//  SampleReducer.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

class SampleReducer: ReducerProtocol {

    typealias Mutation = SampleMutation
    typealias State = SampleState
    
    static func reduce(state: SampleState, mutation: SampleMutation) -> SampleState {
        var state = state
        switch mutation {
        case .loadUsers(let model):
            switch model {
            case .success(let users):
                state = users.isEmpty ? .empty : .success(users)
            
            case .error:
                state = .error
            
            case .loading:
                state = .loading
            }
        }
        return state
    }
}
