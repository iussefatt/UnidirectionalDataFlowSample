//
//  UserResponse.swift
//  UnidirectionalDataFlow
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

import ObjectMapper

struct UserResponse: ImmutableMappable {
    let id: Int
    let name: String
    
    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
    }
}
