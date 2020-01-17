//
//  SampleSection.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxDataSources

struct SampleSection: SectionModelType, Equatable {    
    typealias Item = SampleSectionItem
    var title: String
    var items: [SampleSectionItem]
}

extension SampleSection {
    init(original: SampleSection, items: [SampleSectionItem]) {
        self = original
        self.items = items
    }
}

struct UserSectionItemModel: Equatable {
    let id: String
    let name: String
}

enum SampleSectionItem: Equatable {
    case user(UserSectionItemModel)
}
