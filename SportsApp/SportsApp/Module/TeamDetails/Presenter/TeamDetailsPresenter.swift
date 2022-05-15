//
//  TeamDetailsPresenter.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
class TeamDetailsPresenter{
    var allTeams : [Team]!
    var view : TeamDetailsProtcol!
    
    init(NWService : NetworkService){
    }
    
    func attatchView(view:TeamDetailsProtcol){
        self.view = view
    }
    
    func getAllTeams(){
        NetworkService.getTeamDetails(leagueName: "English%20Premier%20League") { [weak self] (allTeams, nil) in
            self?.allTeams = allTeams?.teams
            DispatchQueue.main.async {
                self?.view.setUpUI()
                print("DispatchQueue Presenter")
            }
        }
    }

    
}


