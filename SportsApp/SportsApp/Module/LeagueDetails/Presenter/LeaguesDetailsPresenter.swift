//
//  LeaguesDetailsPresenter.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
class LeagueDetailsPresenter{
    var allTeams : [Team]!
    var view : LeagueDetailsProtocol!
    var upcomingEvents : [Event]!
    var matches : [Event]!

    
    init(NWService : NetworkService){
    }
    
    func attatchView(view:LeagueDetailsProtocol){
        self.view = view
    }
    
    func getAllTeams(){
        NetworkService.getTeamDetails(leagueName: "English%20Premier%20League") { [weak self] (allTeams, nil) in
            self?.allTeams = allTeams?.teams
            DispatchQueue.main.async {
                self?.view.fillTeamsData()
            }
        }
    }
    
    func getUpcomingEvents(){
            
        NetworkService.getUpComing { [weak self] (upcomingEvents, nil) in
            self?.upcomingEvents = upcomingEvents?.events
            DispatchQueue.main.async {
                self?.view.fillUpcomingData()
            }
        }
    }
    func leagueMatches(idLeague: String){
            
        NetworkService.getLeagueMatches(leagueID: idLeague) { [weak self] (matches, nil) in
            self?.matches = matches?.events
            DispatchQueue.main.async {
                self?.view.fillMatchesData()
            }
        }
    }

    
}
