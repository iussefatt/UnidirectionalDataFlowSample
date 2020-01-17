//
//  CompetitionResponse.swift
//  Test
//
//  Created by Ismael Ussefatt on 23/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Foundation
import ObjectMapper

struct CompetitionResponse: ImmutableMappable {
    let id: Int
    let name: String
    let code: String
    let emblemUrl: String?
    let currentSeason: SeasonResponse
    let seasons: [SeasonResponse]
    let lastUpdated: Date
}

extension CompetitionResponse {
    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        code = try map.value("code")
        emblemUrl = try map.value("emblemUrl")
        currentSeason = try map.value("currentSeason")
        lastUpdated = try map.value("lastUpdated", using: DateTransform())

        if let items = map.JSON["seasons"] as? [Any] {
            seasons = items.compactMap { try? SeasonResponse(JSONObject: $0) }
        } else {
            seasons = []
        }
    }
}

struct SeasonResponse: ImmutableMappable {
    let id: Int
    let startDate: Date
    let endDate: Date
    let currentMatchday: Int?
    let winner: ClubResponse?
}

extension SeasonResponse {
    init(map: Map) throws {
        id = try map.value("id")
        startDate = try map.value("startDate", using: DateTransform())
        endDate = try map.value("endDate", using: DateTransform())
        currentMatchday = try? map.value("currentMatchday")
        winner = try? map.value("winner")
    }
}

struct ClubResponse {
    let id: Int
    let name: String
    let shortName: String
    let tla: String
    let crestURL: URL?
}

extension ClubResponse: ImmutableMappable {
    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        shortName = try map.value("shortName")
        tla = try map.value("tla")
        crestURL = try map.value("crestURL", using: URLTransform())
    }
}
