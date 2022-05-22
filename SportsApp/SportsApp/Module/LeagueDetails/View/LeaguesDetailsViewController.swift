//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/13/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import UIKit
import CoreData

protocol LeagueDetailsProtocol {
    func fillTeamsData()
    func fillUpcomingData()
    func fillMatchesData()
    func setUpFav()
}

class LeaguesDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet weak var back: UIImageView!
    
    @IBOutlet weak var latestCV: UICollectionView!
    
    @IBOutlet weak var teamsCV: UICollectionView!
    
    @IBOutlet weak var upComingCV: UICollectionView!
    
    var teams: [Team] = [Team]()
    var upcomingEvents: [Event] = [Event]()
    var leagueMatches: [Event] = [Event]()
    
    var leagueId: String?
    var selectedLeague: League?
    
    var presenter: LeagueDetailsPresenter!
    var selectedTeam: Team!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set delegates
        upComingCV.delegate = self
        upComingCV.dataSource = self
        teamsCV.delegate = self
        teamsCV.dataSource = self
        latestCV.delegate = self
        latestCV.dataSource = self
        
        //PRESENTER
        
        presenter = LeagueDetailsPresenter(NWService: NetworkService())
        presenter.attatchView(view: self)
        presenter.getAllTeams(league:"English%20Premier%20League")
        //presenter.getUpcomingEvents()
        presenter.leagueMatches(idLeague: selectedLeague!.idLeague!)
        
        handleBack()
        setUpFav()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == upComingCV{
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
            
        }
        if collectionView == latestCV{
            return CGSize(width: collectionView.frame.size.width/1.0, height: collectionView.frame.size.width/2.0)
            
        }
        return CGSize(width: collectionView.frame.width/3.0, height: collectionView.frame.width/3.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == upComingCV{
            return leagueMatches.count
        }
        if collectionView == latestCV{
            return leagueMatches.count
        }
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upComingCV {
            let event: Event = leagueMatches[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcoming_cell", for: indexPath) as! UpcomingCell
            cell.layer.cornerRadius = 10
            let url = URL(string: event.strThumb)
            cell.imageEvent.kf.setImage(with: url)
            cell.imageEvent.layer.cornerRadius = 15
            cell.imageEvent.layer.masksToBounds = true
            cell.dateLabel.text = event.dateEvent
            cell.timeLabel.text = event.strTime
            
            return cell
        }
        if collectionView == latestCV {
            let event: Event = leagueMatches[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latest_cell", for: indexPath) as! LatestCell
            cell.layer.cornerRadius = 10
            let url = URL(string: event.strThumb)
            cell.latestImage.kf.setImage(with: url)
            cell.latestImage.layer.cornerRadius = 15
            cell.latestImage.layer.masksToBounds = true
            cell.result.text = "\(event.intHomeScore ?? "1") : \(event.intAwayScore ?? "0")"
            return cell
        }
        let team : Team = teams[indexPath.row]
        
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teams_cell", for: indexPath) as! TeamCell
        
        let url = URL(string: team.teamBadge)
        
        teamCell.teamBadge.kf.setImage(with: url)
        return teamCell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == teamsCV{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "team_details")
                as TeamDetailsViewController
            
            vc.modalPresentationStyle = .fullScreen
            vc.selectedTeam = teams[indexPath.row]
            
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    func handleBack(){
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        
        back.addGestureRecognizer(backTap)
        back.isUserInteractionEnabled = true
        
    }
    @objc func backTapped(gesture: UIGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func addToFav(_ sender: Any) {
        print(selectedLeague?.idLeague)
        if(!(presenter?.isFav(leagueId: selectedLeague?.idLeague ?? "0"))!){
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            presenter.addToFavs(league: selectedLeague!)
        }else{
            favBtn.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
            presenter.deleteFromFavs(league: selectedLeague!)
        }
    }
    
}


extension LeaguesDetailsViewController: LeagueDetailsProtocol{
    func fillTeamsData() {
        
        teams = presenter.allTeams
        teamsCV.reloadData()
        
    }
    
    func fillUpcomingData(){
        upcomingEvents = presenter.upcomingEvents
        upComingCV.reloadData()
        latestCV.reloadData()
    }
    
    func fillMatchesData(){
        leagueMatches = presenter.matches
        latestCV.reloadData()
        upComingCV.reloadData()
    }
    
    func setUpFav(){
        if((presenter?.isFav(leagueId: selectedLeague?.idLeague ?? "0"))!){
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            favBtn.reloadInputViews()
        }else{
            favBtn.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
            favBtn.reloadInputViews()
        }
    }
    
}
