//
//  AllLeaguesViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit
import Kingfisher

protocol AllLeaguesProtocol : AnyObject{
    func stopAnimating()
    func updateUI(leagues: [League])
}

class AllLeaguesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    var leaguesArray = [League]()
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllLeaguesPresenter!
    var selectedLeague: League!
    var leagueName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        title = "All Leagues"
        presenter = AllLeaguesPresenter(NWService: NetworkService())
        presenter.attachView(view: self)
        presenter.getItems(title: leagueName ?? "")
        
        let tap = UIGestureRecognizer(target: self, action: #selector(goBack))
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
        // #warning Incomplete implementation, return the number of rows
        return leaguesArray.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllLeaguesTableViewCell
        let league = leaguesArray[indexPath.row]
        cell.leagueNameLbl.text = league.strLeague
        let url = URL(string: league.strBadge!)
        cell.leagueImg.kf.setImage(with: url)
        cell.youtubeBtn.tag = indexPath.row
        cell.youtubeBtn.addTarget(self, action: #selector(buttonAction(sender:)), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let leagueDetails = main.instantiateViewController(identifier: "leagueDetailsVC") as LeaguesDetailsViewController
        leagueDetails.modalPresentationStyle = .fullScreen
        leagueDetails.selectedLeague = leaguesArray[indexPath.row]
        self.present(leagueDetails, animated: true, completion: nil)
       
    }
    
    
    
    
    
    @objc func buttonAction(sender: UIButton){
        if Connectivity.isNetworkReachable(){
            let url = NSURL(string:"https://\(leaguesArray[sender.tag].strYoutube ?? "")")! as URL
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else{
                showAlert(title: "Alert", message: "Can't reach channel")
            }
        }
        else{
            showAlert(title: "Connection Alert", message: "There is no connection. Please check your connection and try again")
        }
        
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
}

extension AllLeaguesViewController : AllLeaguesProtocol {
    func stopAnimating() {
        indicator.stopAnimating()
    }
    func updateUI(leagues: [League]){
        leaguesArray = leagues
        self.myTable.reloadData()
    }
}
