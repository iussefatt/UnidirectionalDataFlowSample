//
//  SampleMutation.swift
//  UnidirectionalDataFlow
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

import Foundation

enum UserMutationModel: Equatable {
    case success([User])
    case error(SampleError)
    case loading
}

enum SampleMutation: Equatable {
    case loadUsers(UserMutationModel)
}
