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

struct AllEvents  :  Decodable {
    let events : [Event]
}

struct Event : Decodable{
    let idEvent : String
    let idAPIfootball : String
    let strEvent : String
    let strEventAlternate : String
   let strFilename: String
    let strSport : String
    let idLeague : String
    let strLeague : String
    let strSeason: String
    let strHomeTeam :  String
    let strAwayTeam : String
    //let intHomeScore : String
    //let intAwayScore : String
    let strTimestamp: String
    let dateEvent:String
    //let dateEventLocal:String
    let strTime:String
    //let strTimeLocal:String
    let strThumb : String
    
    /*"strDescriptionEN":"",
     "strHomeTeam":"KS Teuta",
     "strAwayTeam":"Partizani",
     "intHomeScore":"1",
     "intRound":"1",
     "intAwayScore":"0",
     "intSpectators":null,
     "strOfficial":"",
     "strTimestamp":"2021-09-10T17:45:00+00:00",
     "dateEvent":"2021-09-10",
     "dateEventLocal":"2021-09-11",
     "strTime":"17:45:00",
     "strTimeLocal":"17:00:00",
     "strTVStation":null,
     "idHomeTeam":"134055",
     "idAwayTeam":"137799",
     "intScore":null,
     "intScoreVotes":null,
     "strResult":"",
     "strVenue":"Stadiumi Niko Dovana",
     "strCountry":"Albania",
     "strCity":"",
     "strPoster":"",
     "strSquare":"",
     "strFanart":null,
     "strThumb":"https:\/\/www.thesportsdb.com\/images\/media\/event\/thumb\/omth271639087437.jpg",
     "strBanner":"",
     "strMap":null,
     "strTweet1":"",
     "strTweet2":"",
     "strTweet3":"",
     "strVideo":"",
     "strStatus":"Match Finished",
     "strPostponed":"no",
     "strLocked":"unlocked"*/
}
