//
//  SampleAdapterBehaviour.swift
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

struct SampleAdapterContext {
    let items: [User]
    let sections: [SampleSection]
}

class SampleAdapterBehaviour: Behavior<SampleAdapterContext> {

    override class func spec(_ aContext: @escaping () -> SampleAdapterContext) {

        it("Should return correct section model") {
            let scheduler = TestScheduler(initialClock: 0)
            let observer = scheduler.createObserver([SampleSection].self)
            let subject = PublishSubject<SampleState>()
            
            subject
                .asDriverOnErrorJustComplete()
                .mapToSections()
                .asObservable()
                .noReturnSubscribe(observer)

            subject.onNext(.success(aContext().items))
            subject.onCompleted()

            expect(observer.nextEvents).toEventually(
                equal([aContext().sections]),
                timeout: 5,
                pollInterval: 0.3
            )
        }
    }
}
