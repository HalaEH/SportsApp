//
//  AllLeaguesPresenter.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
class AllLeaguesPresenter {
    
    var result : [League]! // model
    weak var view : AllLeaguesProtocol!  // DI
    
    init(NWService : NetworkService){
        //self.NWService = NWService
        //NWService = NetworkService() // no Dependency Injection
    }
    
    func attachView(view: AllLeaguesProtocol){
        self.view = view
    }
    
    func getItems(title: String){
        NetworkService.getAllLeagues(sport: title){[weak self ](result ,error) in
            if result.countries != nil {
                self?.result = result.countries
                print(result.countries[0].strLeague ?? "")
            }
            else {
                print("error")
            }
            DispatchQueue.main.async {
                self?.view.stopAnimating()
                self?.view.updateUI(leagues: result.countries)
            }
        }
    }
    
}

