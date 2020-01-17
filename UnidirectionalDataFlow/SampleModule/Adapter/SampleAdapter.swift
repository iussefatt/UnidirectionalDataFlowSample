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
            case .success(let seasons):
                let items = seasons.map { season -> SampleSectionItem in
                    let model = SampleSectionItemSeasonModel(
                        year: "\(season.startDate)/\(season.endDate))",
                        winnerName: season.winner?.name ?? "",
                        winnerCrewURL: season.winner?.crestURL,
                        isCurrent: false
                    )
                    return .season(model)
                }
                return [SampleSection(title: "Seasons", items: items)]
            
            default:
                return []
            }
        }
        .asDriverOnErrorJustComplete()
    }
}
