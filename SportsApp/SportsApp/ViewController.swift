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
    var leagues: [League] = [League]()
    var teams: [Team] = [Team]()
    @IBAction func btn(_ sender: UIButton) {
        print("hi")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        NetworkService.getAllLeagues(sport: "Soccer"){[weak self]
            (result ,error) in
            if result != nil {
                self?.leagues = result.countries
                print(self?.leagues)
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
