//
//  EndPoint.swift
//  SportsApp
//
//  Created by Hala Emad on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

enum EndPoints {
    case allSports
    case allLeagues(sport:String)
    case leagueDetails(league: String, sport: String)
    case allTeams(leagueStr: String)
    case teamDetails(leagueStr: String)
    case upComing
    case matches(leagueID: String)
    
    
    var path:String{
        switch self {
        case .allSports:
            return "/all_sports.php"
        case .allLeagues(let sport):
            return "/search_all_leagues.php?s=\(sport)&c=England"
        case .leagueDetails(let league, let sport):
            return "/eventsseason.php?id=\(league)&s=\(sport)"
        case .allTeams(let leagueStr):
            return "/search_all_teams.php?l=\(leagueStr)"
        case .teamDetails(let leagueStr):
            return "/search_all_teams.php?l=\(leagueStr)"
        case .upComing:
            return "/eventsround.php?id=4328&r=38&s=2021-2022"
          //  return "/eventslast.php?id=\(teamId)"
            //https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=4328&r=38&s=2021-2022
        case .matches(let leagueID):
            return "/eventsseason.php?id=\(leagueID)"
            
        }
    }
 
    
}
