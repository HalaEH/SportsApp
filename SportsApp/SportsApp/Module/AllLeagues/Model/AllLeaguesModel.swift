//
//  AllLeaguesModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
/*
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
        case idLeague = "idLeague"
        case sportName = "strSport"
        case leagueName = "strLeague"
        case country = "strCountry"
        case youtube = "strYoutube"
        case badge = "strBadge"
        
    }
}*/

struct AllLeagues: Codable{
    let leagues: [League]
}

struct League: Codable{
    let idLeague : String?
    let strSport : String?
    let strLeague : String?
    let strCountry : String?
    let strYoutube : String?
    let strBadge : String?
    
    enum CodingKeys : String, CodingKey{
        case idLeague = "idLeague"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case strCountry = "strCountry"
        case strYoutube = "strYoutube"
        case strBadge = "strBadge"
        
    }
}
