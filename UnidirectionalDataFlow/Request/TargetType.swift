//
//  TargetType.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Alamofire

struct TargetTypeTask {
    var parameters: Parameters?
    var enconding: ParameterEncoding
}

protocol TargetType {
    var url: URL { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var method: HTTPMethod { get }
    var sampleData: Data { get }
    var task: TargetTypeTask { get }
}

extension TargetType {
    var sampleData: Data { Data() }
}
