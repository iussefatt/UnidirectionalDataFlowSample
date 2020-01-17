//
//  Rx+Extensions.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableConvertibleType {

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return self.asDriver(onErrorDriveWith: .empty())
    }
    
    func mapToAction<A>(_ action: A) -> Observable<A> {
        asObservable().map { _ in action }
    }
}
