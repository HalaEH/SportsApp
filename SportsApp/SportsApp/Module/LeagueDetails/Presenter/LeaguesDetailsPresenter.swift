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
    lazy var favDataSource = FavoritesDataSource.instance

    
    init(NWService : NetworkService){
    }
    
    func attatchView(view:LeagueDetailsProtocol){
        self.view = view
    }
    //"English%20Premier%20League"
    func getAllTeams(league: String){
        NetworkService.getAllTeams(leagueName: league) { [weak self] (allTeams, nil) in
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
    
    func isFav(leagueId: String)->Bool{
        return favDataSource.isFav(leagueId: leagueId)
    }
    
    func addToFavs(league: League){
        favDataSource.saveLeague(league: league)
    }
    
    func deleteFromFavs(league: League){
        favDataSource.deleteLeague(league: league)
    }

}
