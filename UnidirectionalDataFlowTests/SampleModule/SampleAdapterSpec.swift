//
//  SampleAdapterSpec.swift.swift
//  UnidirectionalDataFlowTests
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

@testable import UnidirectionalDataFlow
import Quick
import Nimble

final class SampleAdapterSpec: QuickSpec {
    
    override func spec() {
        when("Has user items", itBehavesLike: SampleAdapterBehaviour.self) {
            SampleAdapterContext(
                items: [
                    User(id: 0, name: "User 1"),
                    User(id: 1, name: "User 2")
                ],
                sections: [
                    SampleSection(title: "Users", items: [
                        .user(.init(id: "0", name: "User 1")),
                        .user(.init(id: "1", name: "User 2"))
                    ]
                )
            ])
        }
    }
}
