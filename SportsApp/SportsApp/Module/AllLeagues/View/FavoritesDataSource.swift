//
//  FavoritesDataSource.swift
//  SportsApp
//
//  Created by Hala Emad on 5/17/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol favLeagueProtocol {
    func saveLeague(league: League)
    func getFavs()  -> [NSManagedObject]
    func deleteLeague(league: League)
}

class FavoritesDataSource: favLeagueProtocol{
    var managedContext: NSManagedObjectContext?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

     
    static let instance = FavoritesDataSource()
    private init(){
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    private let concurrentFavQueue = DispatchQueue(label: "favQueue",attributes: .concurrent)
    
    func getFavs()  -> [NSManagedObject]{
        var savedLeagues: [NSManagedObject] = []
        concurrentFavQueue.async(flags: .barrier){[weak self] in
            guard let self = self else {return}
            savedLeagues = self.getSavedLeagues("FavLeague")
        }
        return savedLeagues;
    }
    
    func saveLeague(league: League) {
        if let mContext = self.managedContext{
            print("saving")
            let leagueEntity = NSEntityDescription.insertNewObject(forEntityName: "FavLeague", into: mContext)
            leagueEntity.setValue(league.strLeague, forKey: "strLeague")
            leagueEntity.setValue(league.idLeague, forKey: "idLeague")
            leagueEntity.setValue(league.strBadge, forKey: "strBadge")
            leagueEntity.setValue(league.strCountry, forKey: "strCountry")
            leagueEntity.setValue(league.strSport, forKey: "strSport")
            leagueEntity.setValue(league.strYoutube, forKey: "strYoutube")
            do{
                try mContext.save()
            }catch let error as NSError{
                print(error)
            }
        }
    }
    
    func deleteLeague(league: League) {
        do{
            if let mContext = self.managedContext{
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavLeague")
                fetchRequest.predicate = NSPredicate(format: "idLeague == %@", league.idLeague?.description ?? "")
                let result = try mContext.fetch(fetchRequest)
                mContext.delete((result as! [NSManagedObject]).first!)
                try self.managedContext?.save()
            }
        }catch let error{
            print("Can't delete: ",error)
        }
    }
    
    
     func getSavedLeagues(_ entity: String) -> [NSManagedObject]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        do{
            if let mContext = managedContext{
                let results = try mContext.fetch(fetchRequest) as? [NSManagedObject]
                if let savedLeagues = results{
                    print("SAVED")
                    return savedLeagues
                }
            }
        } catch let error{
            print("Can't fetch saved leagues: ",error)
        }
        return [NSManagedObject]()
    }
    
    
    func isFav(leagueId: String) -> Bool{
        do{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavLeague")
            fetchRequest.predicate = NSPredicate(format: "idLeague == %@", leagueId)
            if let mContext = self.managedContext{
                let result = try mContext.fetch(fetchRequest)
                if result.count>0{
                    return true
                }
            }
        }catch let error{
            print("Can't fetch isFav: ",error)
        }
        return false
    }
}
