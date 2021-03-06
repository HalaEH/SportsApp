//
//  NetworkService.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiProtocol {
    static func getAllSports(completion: @escaping (AllSports?, Error?)->Void)
    static func getUpComing(completion: @escaping (AllEvents?, Error?)->Void)
    static func getAllLeagues(sport: String,completion: @escaping (AllLeagues, Error?)->Void)
    static func getLeagueDetails(endPoint: EndPoints,completion: @escaping (LeagueDetails?, Error?)->Void)
    static func getAllTeams(leagueName: String, completion: @escaping (TeamDetails?, Error?)->Void)
}


class NetworkService: ApiProtocol{
    static var baseUrl = "https://www.thesportsdb.com/api/v1/json/2"
    
    static func getAllSports(completion : @escaping (AllSports?, Error?)->Void) {
        let path = "\(baseUrl)\(EndPoints.allSports.path)"
        
        AF.request(path).validate().responseDecodable(of: AllSports.self) { (response) in
            switch response.result {
            case .success( _):
                print("sucess")
                guard let AllSportData = response.value
                    else {return}
                completion(AllSportData,nil)
            
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
            }
        }
    }
    static func getUpComing(completion : @escaping (AllEvents?, Error?)->Void) {
        let path = "\(baseUrl)\(EndPoints.upComing.path)"
        
        AF.request(path).validate().responseDecodable(of: AllEvents.self) { (response) in
            switch response.result {
            case .success( _):
                guard let upcomingEvents = response.value
                    else {return}
                completion(upcomingEvents,nil)
            
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
            }
        }
    }
    static func getLeagueMatches(leagueID: String,completion : @escaping (AllEvents?, Error?)->Void) {
        let path = "\(baseUrl)\(EndPoints.matches(leagueID: leagueID).path)"
        
        AF.request(path).validate().responseDecodable(of: AllEvents.self) { (response) in
            switch response.result {
            case .success( _):
                guard let upcomingEvents = response.value
                    else {return}
                completion(upcomingEvents,nil)
            
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
            }
        }
    }
    
      static func getAllLeagues(sport: String,completion : @escaping (AllLeagues, Error?)->Void) {
         let path = "\(baseUrl)\(EndPoints.allLeagues(sport: sport).path)"

                 AF.request(path).validate().responseDecodable(of: AllLeagues.self) { (response) in
                     switch response.result {
                     case .success( _):
                         print("sucess")
                         guard let TeamsData = response.value
                             else {return}
                         completion(TeamsData,nil)
                         
                     case .failure(let error):
                         print("fail")
                         print(error)
                      //   completion(nil , error)
                     }
                 }
      }
    
    static func getLeagueDetails(endPoint: EndPoints,completion : @escaping (LeagueDetails?, Error?)->Void) {
        let path = "\(baseUrl)\(endPoint)"
        
        AF.request(path).validate().responseDecodable(of: LeagueDetails.self) { (response) in
            switch response.result {
            case .success( _):
                print("sucess")
                guard let LeaguesData = response.value
                    else {return}
                completion(LeaguesData,nil)
                
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
                
                
            }
        }
    }
    
    static func getAllTeams(leagueName: String, completion : @escaping (TeamDetails?, Error?)->Void) {
        let path = "\(baseUrl)\(EndPoints.teamDetails(leagueStr: leagueName).path)"
        

        AF.request(path).validate().responseDecodable(of: TeamDetails.self) { (response) in
            switch response.result {
            case .success( _):
                guard let TeamsData = response.value
                    else {return}
                completion(TeamsData,nil)
                
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
                
                
            }
        }
    }
    
    
}
