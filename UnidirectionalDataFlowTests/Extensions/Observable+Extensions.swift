//
//  Observable+Extensions.swift
//  UnidirectionalDataFlowTests
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

import RxSwift

extension Observable {
    
    @discardableResult
    func noReturnSubscribe<O: ObserverType>(_ observer: O) -> Disposable where O.Element == Element {
        return subscribe(observer)
    }
}
