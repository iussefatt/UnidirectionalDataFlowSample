//
//  Quick+Extensions.swift
//  UnidirectionalDataFlowTests
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

import Foundation
import Quick
import Nimble

public func when(_ description: String, flags: FilterFlags = [:], closure: () -> Void) {
    describe(description, flags: flags, closure: closure)
}

public func when<C>(
    _ description: String,
    itBehavesLike behavior: Behavior<C>.Type,
    flags: FilterFlags = [:],
    file: FileString = #file,
    line: UInt = #line,
    context: @escaping () -> C
    ) {
    
    when(description) {
        itBehavesLike(behavior, flags: flags, file: file, line: line, context: context)
    }
}
