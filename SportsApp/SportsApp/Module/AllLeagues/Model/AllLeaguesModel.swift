//
//  AllLeaguesModel.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

struct AllLeagues: Codable{
    let leagues: [String:[League]]
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
}

/*struct AllLeagues: Codable{
    let leagues: [String:[Countries]]
}*/
/*
struct League: Codable{
    let idLeague : String? = nil
    let strSport : String? = nil
    let strLeague : String? = nil
    let strCountry : String? = nil
    let strYoutube : String? = nil
    let strBadge : String? = nil
    
    enum CodingKeys : String, CodingKey{
        case idLeague = "idLeague"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case strCountry = "strCountry"
        case strYoutube = "strYoutube"
        case strBadge = "strBadge"
        
    }
}
*//*
struct Countries: Codable {

var idLeague           : String? = nil
var idSoccerXML        : String? = nil
var idAPIfootball      : String? = nil
var strSport           : String? = nil
var strLeague          : String? = nil
var strLeagueAlternate : String? = nil
var intDivision        : String? = nil
var idCup              : String? = nil
var strCurrentSeason   : String? = nil
var intFormedYear      : String? = nil
var dateFirstEvent     : String? = nil
var strGender          : String? = nil
var strCountry         : String? = nil
var strWebsite         : String? = nil
var strFacebook        : String? = nil
var strInstagram       : String? = nil
var strTwitter         : String? = nil
var strYoutube         : String? = nil
var strRSS             : String? = nil
var strDescriptionEN   : String? = nil
var strDescriptionDE   : String? = nil
var strDescriptionFR   : String? = nil
var strDescriptionIT   : String? = nil
var strDescriptionCN   : String? = nil
var strDescriptionJP   : String? = nil
var strDescriptionRU   : String? = nil
var strDescriptionES   : String? = nil
var strDescriptionPT   : String? = nil
var strDescriptionSE   : String? = nil
var strDescriptionNL   : String? = nil
var strDescriptionHU   : String? = nil
var strDescriptionNO   : String? = nil
var strDescriptionPL   : String? = nil
var strDescriptionIL   : String? = nil
var strTvRights        : String? = nil
var strFanart1         : String? = nil
var strFanart2         : String? = nil
var strFanart3         : String? = nil
var strFanart4         : String? = nil
var strBanner          : String? = nil
var strBadge           : String? = nil
var strLogo            : String? = nil
var strPoster          : String? = nil
var strTrophy          : String? = nil
var strNaming          : String? = nil
var strComplete        : String? = nil
var strLocked          : String? = nil

enum CodingKeys: String, CodingKey {

  case idLeague           = "idLeague"
  case idSoccerXML        = "idSoccerXML"
  case idAPIfootball      = "idAPIfootball"
  case strSport           = "strSport"
  case strLeague          = "strLeague"
  case strLeagueAlternate = "strLeagueAlternate"
  case intDivision        = "intDivision"
  case idCup              = "idCup"
  case strCurrentSeason   = "strCurrentSeason"
  case intFormedYear      = "intFormedYear"
  case dateFirstEvent     = "dateFirstEvent"
  case strGender          = "strGender"
  case strCountry         = "strCountry"
  case strWebsite         = "strWebsite"
  case strFacebook        = "strFacebook"
  case strInstagram       = "strInstagram"
  case strTwitter         = "strTwitter"
  case strYoutube         = "strYoutube"
  case strRSS             = "strRSS"
  case strDescriptionEN   = "strDescriptionEN"
  case strDescriptionDE   = "strDescriptionDE"
  case strDescriptionFR   = "strDescriptionFR"
  case strDescriptionIT   = "strDescriptionIT"
  case strDescriptionCN   = "strDescriptionCN"
  case strDescriptionJP   = "strDescriptionJP"
  case strDescriptionRU   = "strDescriptionRU"
  case strDescriptionES   = "strDescriptionES"
  case strDescriptionPT   = "strDescriptionPT"
  case strDescriptionSE   = "strDescriptionSE"
  case strDescriptionNL   = "strDescriptionNL"
  case strDescriptionHU   = "strDescriptionHU"
  case strDescriptionNO   = "strDescriptionNO"
  case strDescriptionPL   = "strDescriptionPL"
  case strDescriptionIL   = "strDescriptionIL"
  case strTvRights        = "strTvRights"
  case strFanart1         = "strFanart1"
  case strFanart2         = "strFanart2"
  case strFanart3         = "strFanart3"
  case strFanart4         = "strFanart4"
  case strBanner          = "strBanner"
  case strBadge           = "strBadge"
  case strLogo            = "strLogo"
  case strPoster          = "strPoster"
  case strTrophy          = "strTrophy"
  case strNaming          = "strNaming"
  case strComplete        = "strComplete"
  case strLocked          = "strLocked"

}
}*/
