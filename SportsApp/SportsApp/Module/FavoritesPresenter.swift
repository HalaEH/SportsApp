//
//  FavoritesPresenter.swift
//  SportsApp
//
//  Created by Hala Emad on 5/19/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation

class FavoritesPresenter{
    
    var result : [League]! // model
    weak var view : FavLeaguesProtocol!
    var dataSource: FavoritesDataSource?
    
    init(){
        dataSource = FavoritesDataSource.instance
    }
    
    func attachView(view: FavLeaguesProtocol){
        self.view = view
    }
    
    func getFavLeagues(){
       // let savedLeagues = self.getSavedLeagues("FavLeague")
        let result = dataSource?.getSavedLeagues("FavLeague")
        DispatchQueue.main.async {
            self.view.stopAnimating()
            self.view.updateUI(leagues: result! )
            print(result)
        }
    }
    
    func deleteLeague(league: League){
        dataSource?.deleteLeague(league: league)
    }
    
}
