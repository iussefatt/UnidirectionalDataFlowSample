//
//  SampleSection.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import RxDataSources

struct SampleSection: SectionModelType {
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

struct SampleSectionItemSeasonModel {
    var year: String
    var winnerName: String
    var winnerCrewURL: URL?
    var isCurrent = false
}

enum SampleSectionItem {
    case season(SampleSectionItemSeasonModel)
}
