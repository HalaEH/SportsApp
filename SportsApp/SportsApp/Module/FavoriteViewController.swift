//
//  FavoriteViewController.swift
//  SportsApp
//
//  Created by Hala Emad on 5/18/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit
import CoreData
import Kingfisher

protocol FavLeaguesProtocol : AnyObject{
    func stopAnimating()
    func updateUI(leagues: [NSManagedObject])
}

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    var leaguesArray: [NSManagedObject]?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : FavoritesPresenter!
    var selectedLeague: League!
    var leagueName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        
        leaguesArray = []
        
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        title = "Favorite Leagues"
        presenter = FavoritesPresenter()
        presenter.attachView(view: self)
        presenter.getFavLeagues()
        
    }
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("rows")
        print(self.leaguesArray?.count)
        // #warning Incomplete implementation, return the number of rows
        return self.leaguesArray?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavTableViewCell
        let league = leaguesArray?[indexPath.row]
        cell.favLeagueNameLbl.text = leaguesArray?[indexPath.row].value(forKey: "strLeague") as? String ?? ""
        print("leaguename")
        let url = URL(string: league?.value(forKey: "strBadge") as? String ?? "")
        cell.favLeagueImg.kf.setImage(with: url)
        cell.favYoutubeBtn.tag = indexPath.row
        cell.favYoutubeBtn.addTarget(self, action: #selector(buttonAction(sender:)), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Connectivity.isNetworkReachable(){
            var selectedLeague: League = League()
            selectedLeague.idLeague = leaguesArray?[indexPath.row].value(forKey: "idLeague") as? String
            selectedLeague.strLeague = leaguesArray?[indexPath.row].value(forKey: "strLeague") as? String
            selectedLeague.strCountry = leaguesArray?[indexPath.row].value(forKey: "strCountry") as? String
            selectedLeague.strSport = leaguesArray?[indexPath.row].value(forKey: "strSport") as? String
            selectedLeague.strYoutube = leaguesArray?[indexPath.row].value(forKey: "strYoutube") as? String
            
            let main = UIStoryboard(name: "Main", bundle: nil)
            let leagueDetails = main.instantiateViewController(identifier: "leagueDetailsVC") as LeaguesDetailsViewController
            leagueDetails.modalPresentationStyle = .fullScreen
            leagueDetails.selectedLeague = selectedLeague
            self.present(leagueDetails, animated: true, completion: nil)
        }
        else{
            showAlert(title: "Connection Alert", message: "There is no connection. Please check your connection and try again")
        }
        
        
        
        /*leagueDetails.sportName = leaguesArray[indexPath.row].strSport
         navigationController?.pushViewController(leagueDetails, animated: true)*/
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func buttonAction(sender: UIButton){
        if Connectivity.isNetworkReachable(){
            let url = NSURL(string:"https://\(leaguesArray?[sender.tag].value(forKey: "strYoutube") ?? "")")! as URL
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else{
                showAlert(title: "Alert", message: "Can't reach channel")
                
            }
        }        else{
            showAlert(title: "Connection Alert", message: "There is no connection. Please check your connection and try again")
        }
        
    }
    
    
    
    
     // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        var selectedLeague: League = League()
        selectedLeague.idLeague = leaguesArray?[indexPath.row].value(forKey: "idLeague") as? String
        selectedLeague.strLeague = leaguesArray?[indexPath.row].value(forKey: "strLeague") as? String
        selectedLeague.strCountry = leaguesArray?[indexPath.row].value(forKey: "strCountry") as? String
        selectedLeague.strSport = leaguesArray?[indexPath.row].value(forKey: "strSport") as? String
        selectedLeague.strYoutube = leaguesArray?[indexPath.row].value(forKey: "strYoutube") as? String
        
         if editingStyle == .delete {
         // Delete the row from the data source
            presenter.deleteLeague(league: selectedLeague)
            leaguesArray!.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
         }
     }
     

    
}

extension FavoriteViewController : FavLeaguesProtocol {
    func stopAnimating() {
        indicator.stopAnimating()
    }
    func updateUI(leagues: [NSManagedObject]){
        leaguesArray = leagues
        print("updateUI")
        print(leagues.count)
        self.myTable.reloadData()
    }
}
