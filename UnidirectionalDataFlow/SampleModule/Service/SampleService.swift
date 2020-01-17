//
//  SampleService.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift

protocol SampleServiceProtocol {
    init(provider: RequestProvider<SampleTargetType>)
    func getUsers() -> Observable<[UserResponse]>
}

class SampleService: SampleServiceProtocol {
    
    private let provider: RequestProvider<SampleTargetType>
    
    required init(provider: RequestProvider<SampleTargetType>) {
        self.provider = provider
    }
    
    func getUsers() -> Observable<[UserResponse]> {
        provider.request(.users)
            .cast(to: [Any].self)
            .mapModel(to: UserResponse.self, throwsOnSingleFail: false)
    }
}
