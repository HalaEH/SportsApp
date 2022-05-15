//
//  TeamDetailsModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

struct TeamDetails: Codable{
    let teams: [Team]
}

struct Team: Codable {
    let idTeam : String
    let teamName: String
    let stadiumName : String
    let stadiumImage : String
    let teamBadge: String
    let website: String
    let facebook : String
    let twitter: String
    let instagram : String
    let youtube: String
    let kitImage: String

    
    enum CodingKeys: String, CodingKey{
        case idTeam = "idTeam"
        case teamName = "strTeam"
        case stadiumName = "strStadium"
        case stadiumImage = "strStadiumThumb"
        case teamBadge = "strTeamBadge"
        case website = "strWebsite"
        case facebook = "strFacebook"
        case twitter = "strTwitter"
        case instagram = "strInstagram"
        case youtube = "strYoutube"
        case kitImage = "strTeamJersey"
        
    }
}
