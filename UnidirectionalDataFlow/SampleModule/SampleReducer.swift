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
        case .loadLeague(let model):
            switch model {
            case .success(let competitions):
                state = competitions.seasons.isEmpty ? .empty : .success(competitions.seasons)
            
            case .error(let error):
                state = .error(error)
            
            case .loading:
                state = .loading
            }
        }
        return state
    }
}
