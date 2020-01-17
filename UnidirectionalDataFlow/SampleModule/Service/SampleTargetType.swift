//
//  SampleTargetType.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Alamofire

enum SampleTargetType: TargetType {
    
    case users
    
    var url: URL {
        URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
    
    var headers: HTTPHeaders? { nil }
    
    var method: HTTPMethod {
        switch self {
        case .users:
            return .get
        }
    }
    
    var task: TargetTypeTask {
        switch self {
        case .users:
            return TargetTypeTask(parameters: nil, enconding: URLEncoding.default)
        }
    }
}
