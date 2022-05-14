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
    
    
    var path:String{
        switch self {
        case .allSports:
            return "/all_sports.php"
        case .allLeagues(let sport):
            return "/search_all_leagues.php?s=\(sport)"
        case .leagueDetails(let league, let sport):
            return "/eventsseason.php?id=\(league)&s=\(sport)"
        case .allTeams(let leagueStr):
            return "/search_all_teams.php?l=\(leagueStr)"
        case .teamDetails(let leagueStr):
            return "/search_all_teams.php?l=\(leagueStr)"
          //  return "/eventslast.php?id=\(teamId)"
            
        }
    }
 
    
}
