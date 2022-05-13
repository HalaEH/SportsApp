//
//  AllSportsModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

struct AllSports: Codable{
    let sports: [Sport]
}

struct Sport: Codable {
    let id : String
    let sportName : String
    let sportFormat : String
    let sportThumb : String
    let iconGreen : String
    let sportDesc : String
    
    enum CodingKeys: String, CodingKey{
        case id = "idSport"
        case sportName = "strSport"
        case sportFormat = "strFormat"
        case sportThumb = "strSportThumb"
        case iconGreen = "strSportIconGreen"
        case sportDesc = "strSportDescription"
        
    }
}

