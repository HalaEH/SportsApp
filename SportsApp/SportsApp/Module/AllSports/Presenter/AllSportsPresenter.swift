//
//  AllSportsPresenter.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

class AllSportsPresenter {
    
    var result : [Sport]! // model
    weak var view : AllSportsProtocol!  // DI
    
    init(NWService : NetworkService){
        //self.NWService = NWService
        //NWService = NetworkService() // no Dependency Injection
    }
    
    func attachView(view: AllSportsProtocol){
        self.view = view
    }
    
    func getItems(){
        NetworkService.getAllSports{[weak self ](result ,error) in
            if result?.sports != nil {
                self?.result = result?.sports
                print(result?.sports[0].sportName ?? "")
            }
            else {
                print("error")
            }
            DispatchQueue.main.async {
                self?.view.stopAnimating()
                self?.view.updateUI(sports: result!.sports)
            }
        }
    }
    
}

