//
//  NetworkService.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
import Alamofire

//https://www.thesportsdb.com/api/v1/json/2/all_sports.php


class NetworkService{
    
    func getResponse(completionHandler: @escaping ([Sport]?, Error?) -> ()) {
        
        /*AF.request("www.thesportsdb.com/api/v1/json/2/all_sports.php", method: .get).responseDecodable(of: [Sport].self) { (response) in
            //print("result: \(response)")
            
            let result = response.result
            switch result {
            case .success(let sports):
                print("Result SUCCESS")
                completionHandler(sports, nil)
            case .failure(let error):
                print("Result FAILED")
                completionHandler(nil, error)
            }
            
        }*/
        AF.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
        .validate()
        .responseDecodable(of: AllSports.self) { (response) in
          guard let allSports = response.value else { return }
            print(allSports.sports.count)
        }
    }
    
    
}
