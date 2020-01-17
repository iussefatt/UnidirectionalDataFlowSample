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
    func getPremierLeague() -> Observable<CompetitionResponse>
}

class SampleService: SampleServiceProtocol {
    
    private let provider: RequestProvider<SampleTargetType>
    
    required init(provider: RequestProvider<SampleTargetType>) {
        self.provider = provider
    }
    
    func getPremierLeague() -> Observable<CompetitionResponse> {
        provider.request(.competition(id: 2021))
            .mapModel(to: CompetitionResponse.self)
    }
}
