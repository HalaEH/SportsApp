//
//  LeaguesDetailsModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
import Foundation

struct LeagueDetails: Codable{
    let events: [Events]
}

struct Events: Codable {
    let idEvent : String
    let eventName : String
    let sportName : String
    let idLeague: String
    let leagueName: String
    let homeTeam : String
    let homeTeamScore: String
    let awayTeam : String
    let awayTeamScore: String
    let eventDate: String
    let eventTime: String
    let eventImage : String
    let eventHighlights: String?
    
    enum CodingKeys: String, CodingKey{
        case idEvent = "idEvent"
        case eventName = "strEvent"
        case sportName = "strSport"
        case idLeague = "idLeague"
        case leagueName = "strLeague"
        case homeTeam = "strHomeTeam"
        case homeTeamScore = "intHomeScore"
        case awayTeam = "strAwayTeam"
        case awayTeamScore = "intAwayScore"
        case eventDate = "dateEvent"
        case eventTime = "strTime"
        case eventImage = "strThumb"
        case eventHighlights = "strVideo"
        
    }
}
