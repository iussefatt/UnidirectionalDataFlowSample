//
//  SampleAdapter.swift
//  Test
//
//  Created by Ismael Ussefatt on 26/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableConvertibleType where Element == SampleState {
    
    func mapToSections() -> Driver<[SampleSection]> {
        asObservable().map { state in
            switch state {
            case .success(let users):
                let items = users.map { user -> SampleSectionItem in
                    .user(UserSectionItemModel(id: "\(user.id)", name: user.name))
                }
                return [SampleSection(title: "Users", items: items)]
            
            default:
                return []
            }
        }
        .asDriverOnErrorJustComplete()
    }
}
