//
//  ViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var sports: [Sport] = [Sport]()
    var leagues: [String:[League]] = [String:[League]]()
    var teams: [Team] = [Team]()
    @IBAction func btn(_ sender: UIButton) {
        print("hi")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*    NetworkService.getAllSports{[weak self ]
         (result ,error) in
         if result?.sports != nil {
         self?.sports = result!.sports
         print(self?.sports.count)
         }
         else {
         print("error")
         }
         }*/
        NetworkService.getAllLeagues(sport: "Soccer"){[weak self]
            (result ,error) in
            if result != nil {
                self?.leagues = result.leagues
                print(self?.leagues.count)
            }
            else {
                print("error")
            }
            
            
        }
        
        /*NetworkService.getTeamDetails(leagueName: "English%20Premier%20League") { [weak self] (result, error) in
         if result?.teams != nil {
         self?.teams = result!.teams
         print(self?.teams.count)
         }
         else {
         print("error")
         }
         }*/
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
