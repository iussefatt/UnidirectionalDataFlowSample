//
//  SampleViewModelSpec.swift
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

class MockService: SampleServiceProtocol {
    
    private let provider: RequestProvider<SampleTargetType>
    
    required init(provider: RequestProvider<SampleTargetType>) {
        self.provider = provider
    }

    func getUsers() -> Observable<[UserResponse]> {
        .just([UserResponse(JSON: ["name": "User 1", "id": 0])!])
    }
}

final class SampleViewModelSpec: QuickSpec {
    
    override func spec() {
        
        when("Input start action") {
            it("Should return correct mutation") {
                let viewModel = SampleViewModel(
                    initialState: .loading,
                    reducer: SampleReducer(),
                    service: MockService(provider: RequestProvider<SampleTargetType>())
                )
                
                let scheduler = TestScheduler(initialClock: 0)
                let observer = scheduler.createObserver(SampleMutation.self)
                
                viewModel.mutate(action: .start).noReturnSubscribe(observer)
                let loadingMutation = SampleMutation.loadUsers(.loading)
                let loadUsersMutation = SampleMutation.loadUsers(.success([User(id: 0, name: "User 1")]))

                expect(observer.nextEvents).toEventually(
                    equal([loadingMutation, loadUsersMutation]),
                    timeout: 5,
                    pollInterval: 0.3
                )
            }
        }
    }
}
