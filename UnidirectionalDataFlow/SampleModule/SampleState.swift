//
//  SampleState.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit

enum SampleAction: ActionProtocol {
    case start
    case showDetail
}

enum LeagueMutationModel {
    case success(Competition)
    case error(Error)
    case loading
}

enum SampleMutation {
    case loadLeague(LeagueMutationModel)
}

enum SampleState {
    case success([Season])
    case loading
    case error(Error)
    case empty
}
