//
//  SampleTargetType.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Alamofire

enum SampleTargetType: TargetType {
    case competition(id: Int)
    
    var url: URL {
        URL(string: "https://api.football-data.org/v2/")!
    }
    
    var path: String {
        switch self {
        case .competition(let id):
            return "competitions/\(id)"
        }
    }
    
    var headers: HTTPHeaders? {
        ["X-Auth-Token": "42cc186fe7334a6ca9a2d70ecd394120"]
    }
    
    var method: HTTPMethod {
        switch self {
        case .competition:
            return .get
        }
    }
    
    var task: TargetTypeTask {
        switch self {
        case .competition:
            return TargetTypeTask(parameters: nil, enconding: URLEncoding.default)
        }
    }
}
