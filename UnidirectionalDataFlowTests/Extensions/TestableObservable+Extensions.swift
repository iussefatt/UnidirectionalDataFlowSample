//
//  TestableObserver.swift
//  InquilinosTests
//
//  Created by Ismael Ussefatt on 24/04/19.
//  Copyright © 2019 Quinto Andar. All rights reserved.
//

import Foundation
import RxSwift
import RxTest

extension TestableObserver {

    var unwrappedEvents: [Event<Element>] {
        return events.map({ $0.value })
    }

    var nextEvents: [Element] {
        return events.compactMap({ event in
            guard case .next(let element) = event.value else { return nil }
            return element
        })
    }
}
