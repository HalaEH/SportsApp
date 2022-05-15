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
    static func getAllLeagues(sport: String,completion: @escaping (AllLeagues, Error?)->Void)
    static func getLeagueDetails(endPoint: EndPoints,completion: @escaping (LeagueDetails?, Error?)->Void)
    static func getTeamDetails(leagueName: String, completion: @escaping (TeamDetails?, Error?)->Void)
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
                print(AllSportData.sports)
                completion(AllSportData,nil)
                print(AllSportData.sports)
            
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
            }
        }
    }
    
    static func getAllLeagues(sport: String,completion : @escaping (AllLeagues, Error?)->Void) {
   //     let path = "\(baseUrl)\(EndPoints.allLeagues(sport: sport).path)"

       /* let param: Parameters = ["s": "Soccer"]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php", method: .get, parameters: param, encoding: URLEncoding.queryString).validate()
            .responseDecodable(of: AllLeagues.self) {
                (response) in
                guard let sportsResponse = response.value?.countries else{
                    print("else")
                    return
                }
                print(sportsResponse.count)
                print("end")
        }*/
       let path = "\(baseUrl)\(EndPoints.allLeagues(sport: sport).path)"

               AF.request(path).validate().responseDecodable(of: AllLeagues.self) { (response) in
                   switch response.result {
                   case .success( _):
                       print("sucess")
                       guard let TeamsData = response.value
                           else {return}
                       print(TeamsData.countries)
                       completion(TeamsData,nil)
                       print(TeamsData.countries)
                       
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
                print(LeaguesData.events)
                completion(LeaguesData,nil)
                print(LeaguesData.events)
                
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
                
                
            }
        }
    }
    
    static func getTeamDetails(leagueName: String, completion : @escaping (TeamDetails?, Error?)->Void) {
        let path = "\(baseUrl)\(EndPoints.teamDetails(leagueStr: leagueName).path)"

        AF.request(path).validate().responseDecodable(of: TeamDetails.self) { (response) in
            switch response.result {
            case .success( _):
                print("sucess")
                guard let TeamsData = response.value
                    else {return}
                print(TeamsData.teams)
                completion(TeamsData,nil)
                print(TeamsData.teams)
                
            case .failure(let error):
                print("fail")
                print(error)
                completion(nil , error)
                
                
            }
        }
    }
    
    
}
