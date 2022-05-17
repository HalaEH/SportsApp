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
        print(leagueName)
        
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
        let url = URL(string: league.strBadge)
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
        leagueDetails.leagueId = leaguesArray[indexPath.row].idLeague
        self.present(leagueDetails, animated: true, completion: nil)

        /*leagueDetails.sportName = leaguesArray[indexPath.row].strSport
        navigationController?.pushViewController(leagueDetails, animated: true)*/
    }

     
     

    
    @objc func buttonAction(sender: UIButton){
        let url = NSURL(string:"https://\(leaguesArray[sender.tag].strYoutube ?? "")")! as URL
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else{
            //alert no connection
        }
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AllLeaguesViewController : AllLeaguesProtocol {
    func stopAnimating() {
        indicator.stopAnimating()
        // presenter.result
    }
    func updateUI(leagues: [League]){
        leaguesArray = leagues
        self.myTable.reloadData()
    }
}
