//
//  Competition.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Foundation

struct Competition {
    var id: Int
    var name: String
    var code: String
    var emblemUrl: String?
    var currentSeason: Season
    var seasons: [Season]
    var lastUpdated: Date
}

extension Competition {
    init(from response: CompetitionResponse) {
        id = response.id
        name = response.name
        code = response.code
        emblemUrl = response.emblemUrl
        currentSeason = Season(from: response.currentSeason)
        seasons = response.seasons.map { Season(from: $0) }
        lastUpdated = response.lastUpdated
    }
}

struct Season {
    var id: Int
    var startDate: Date
    var endDate: Date
    var currentMatchday: Int?
    var winner: Club?
}

extension Season {
    init(from response: SeasonResponse) {
        id = response.id
        startDate = response.startDate
        endDate = response.endDate
        currentMatchday = response.currentMatchday
        
        if let winner = response.winner {
            self.winner = Club(from: winner)
        }
    }
}

struct Club {
    let id: Int
    let name: String
    let shortName: String
    let abbreviation: String
    let crestURL: URL?
}

extension Club {
    init(from response: ClubResponse) {
        id = response.id
        name = response.name
        shortName = response.shortName
        abbreviation = response.tla
        crestURL = response.crestURL
    }
}
