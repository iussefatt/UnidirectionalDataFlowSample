//
//  SampleReducerSpec.swift
//  UnidirectionalDataFlowTests
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

@testable import UnidirectionalDataFlow
import Quick
import Nimble
import RxSwift
import RxCocoa
import RxTest

final class SampleReducerSpec: QuickSpec {
    
    override func spec() {
        
        when("Has a mutation") {
            it("Should return correct state") {
                let state = SampleState.loading
                let mutation = SampleMutation.loadUsers(.success([User(id: 0, name: "User 1")]))
                let newState = SampleReducer.reduce(state: state, mutation: mutation)
                
                expect(newState).to(equal(.success([User(id: 0, name: "User 1")])))
            }
        }
    }
}
