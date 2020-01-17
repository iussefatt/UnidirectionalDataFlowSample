//
//  User.swift
//  UnidirectionalDataFlow
//
//  Created by Ismael Ussefatt on 17/01/20.
//  Copyright © 2020 Ismael Ussefatt. All rights reserved.
//

struct User: Equatable {
    let id: Int
    let name: String
}

extension User {
    
    init(from response: UserResponse) {
        id = response.id
        name = response.name
    }
}
