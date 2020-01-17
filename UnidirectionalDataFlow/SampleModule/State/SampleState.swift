//
//  SampleState.swift
//  Test
//
//  Created by Ismael Ussefatt on 21/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import UIKit

enum SampleState: Equatable {
    case success([User])
    case loading
    case error
    case empty
}
