//
//  AllLeaguesModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

struct AllLeagues: Decodable{
    let countries: [League]
}

struct League: Decodable {
    var idLeague : String?
    var strSport : String?
    var strLeague : String?
    var strCountry : String?
    var strYoutube : String?
    var strBadge : String?
    
   /* enum CodingKeys: String, CodingKey{
        case idLeague = "idLeague"
        case sportName = "strSport"
        case leagueName = "strLeague"
        case country = "strCountry"
        case youtube = "strYoutube"
        case badge = "strBadge"
        
    }*/
}

