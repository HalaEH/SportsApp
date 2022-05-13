//
//  AllLeaguesModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

struct AllLeagues: Codable{
    let leagues: [League]
}

struct League: Codable {
    let idLeague : String
    let sportName : String
    let leagueName : String
    let country : String
    let youtube : String
    let badge : String
    
    enum CodingKeys: String, CodingKey{
        case idLeague = "idSport"
        case sportName = "strSport"
        case leagueName = "strLeague"
        case country = "strCountry"
        case youtube = "strYoutube"
        case badge = "strBadge"
        
    }
}
